# Docked Windows Demo

This demo shows how to build a modern user interface in Delphi/VCL with
**dockable tool windows** as an alternative to the classic – and by now
quite dated – **MDI paradigm** (Multiple Document Interface).

The project deliberately contains no database, no business logic and no
third-party components. The single goal is to demonstrate the VCL
docking concept in a way that is easy to follow.

---

## Why not MDI anymore?

MDI – i.e. `FormStyle = fsMDIForm` together with `fsMDIChild` windows
inside a shared parent client area – dates back to the early 1990s and
is considered problematic today for several reasons:

- **Microsoft itself has effectively retired MDI.** The Windows User
  Experience Guidelines have been advising against MDI for years;
  modern Office and IDE-style applications have long since moved to
  tabbed documents, tool windows and docking instead.
- **A window inside a window** is confusing for users: an MDI child
  cannot leave the parent's client area, cannot be moved to a second
  monitor, and competes with the taskbar.
- **Multi-monitor setups** are the norm today. MDI breaks down
  conceptually here.
- **High DPI and modern theming** do not play well with the
  "mini-desktop inside a window" idea.
- **Accessibility, touch and keyboard navigation** are weaker in MDI
  than with proper top-level windows.
- **VCL maintenance:** MDI has seen virtually no investment for many
  releases. The docking framework, on the other hand, is actively used
  (the Delphi IDE itself relies on it).

In short: when starting a new VCL application today, do **not** reach
for `fsMDIForm`. The actual requirement – several tool and document
views inside a single main window – is better solved with **docking**
and, where appropriate, **tabbed documents** (`TPageControl`).

---

## The concept: dock site + dockable window

The VCL ships with a complete docking framework out of the box. At its
core there are two roles:

### 1. Dock site (the target)

A **dock site** is a container that can host docked windows. Almost any
`TWinControl` descendant can be a dock site. In this demo we use
`TPanel` with the following properties:

| Property            | Value   | Meaning                                                      |
| ------------------- | ------- | ------------------------------------------------------------ |
| `DockSite`          | `True`  | The panel may accept windows that are docked into it.        |
| `UseDockManager`    | `True`  | Multiple docked windows are arranged by the dock manager (stacking, tabs, splitters between them). |
| `Align`             | `alLeft` / `alRight` / `alBottom` | Position of the dock zone inside the main form. |

A `TSplitter` is placed next to each dock zone so the user can resize
the zones at runtime.

### 2. Dockable form (the window that docks)

A **dockable window** is just a regular `TForm`. It becomes a docking
candidate solely through two properties:

| Property    | Value           | Meaning                                                                       |
| ----------- | --------------- | ----------------------------------------------------------------------------- |
| `DragKind`  | `dkDock`        | Dragging the title bar starts a dock operation instead of a regular move.     |
| `DragMode`  | `dmAutomatic`   | The VCL handles drag & drop automatically – no code required.                 |

This makes it possible to:

- **tear** the form out of its current dock site so it floats freely
  (floating window),
- drag it onto another dock site so it **docks there**,
- drag it onto an already docked window so it gets **stacked**
  (tab docking, thanks to `UseDockManager`),
- place it programmatically with `ManualDock(target, nil, alClient)`.

### Floating vs. docked

- **Docked:** The form sits inside a dock site, no longer has a regular
  caption bar of its own and shares the available space with the site.
- **Floating:** The form is a normal top-level window again. It can be
  moved to a second monitor and has its own taskbar entry – exactly
  what MDI never offered.

The `HostDockSite` property is the easiest way to tell the two apart:
`nil` means floating, anything else means docked.

---

## Project layout

```
DockedWindows/
├── DockedWindows.dpr                       Program entry, creates four forms
├── DockedWindows.dproj                     VCL project (Win32)
├── DockedWindows.Main.Form.pas/.dfm        Main form, hosts the dock sites
├── DockedWindows.Toolbox.Form.pas/.dfm     Dockable tool window
├── DockedWindows.Properties.Form.pas/.dfm  Dockable property inspector
└── DockedWindows.Log.Form.pas/.dfm         Dockable log window
```

### Main form (`TFormMain`)

Layout (one regular `TForm` – no MDI involved):

```
+-----------------------------------------------------------+
| MainMenu / ToolBar                                        |
+----------+----------------------------------+-------------+
|          |                                  |             |
|  Panel   |          Panel                   |   Panel     |
|  Left    |          Center                  |   Right     |
|  (Dock)  |        (Workspace)               |   (Dock)    |
|          |                                  |             |
|          |                                  |             |
+----------+----------------------------------+-------------+
|                  Panel Bottom (Dock)                      |
+-----------------------------------------------------------+
|                       StatusBar                           |
+-----------------------------------------------------------+
```

- `PanelLeft`, `PanelRight`, `PanelBottom` are dock sites.
- `PanelCenter` (`Align = alClient`) is the central workspace.
- A `TSplitter` sits between every dock zone and the workspace.

### The three dockable windows

Every tool form (`TFormToolbox`, `TFormProperties`, `TFormLog`) is just
a plain `TForm` with `DragKind = dkDock` and `DragMode = dmAutomatic`.
The `OnClose` handler simply contains:

```pascal
procedure TFormToolbox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;     // closing means hide, not free
end;
```

That way the form's state survives, and the *View* menu can simply make
it visible again.

### Initial layout

The main form's `OnCreate` docks the tool forms into their starting
positions:

```pascal
procedure TFormMain.ShowToolForm(AForm: TForm; ADockTarget: TWinControl);
begin
  if AForm.HostDockSite <> nil then
    AForm.ManualDock(nil, nil, alNone);          // detach first if needed
  AForm.ManualDock(ADockTarget, nil, alClient);  // dock into the target panel
  AForm.Show;
end;
```

The *View → Reset layout* menu item simply calls this routine again to
restore the original arrangement.

---

## Things to try at runtime

1. **Dock / undock:** Grab the title bar of a tool window and drag it
   away → the window starts floating. Drag it back onto a dock panel
   → it docks there.
2. **Stacking (tab docking):** Drag a floating window onto an already
   docked window. The VCL automatically creates tabs (this requires
   `UseDockManager = True`).
3. **Resizing:** Drag the splitters to resize the dock zones.
4. **Close / reopen:** Close a tool window, then bring it back via
   the *View* menu or the toolbar.
5. **Reset layout:** *View → Reset layout* restores the initial
   arrangement.
6. **Multi-monitor:** Drag an undocked window onto a second monitor –
   something MDI fundamentally could not do.

---

## Things deliberately left out

- **Layout persistence:** The VCL allows the dock state to be saved
  and restored (via `TDockTree.SaveToStream` / `LoadFromStream`, or
  manually using `HostDockSite`, `DockOrientation` and friends). For a
  starter demo this would only obscure the core idea – it is the
  natural next step.
- **Custom dock manager:** A custom look & feel for the docking
  process (preview arrows / drop hints similar to the Delphi IDE) is
  not implemented.
- **Tabbed documents in the centre:** The central workspace is a
  simple `TMemo` here. A real application would typically place a
  `TPageControl` there – the proper modern answer to "several open
  documents" (instead of MDI children).

---

## Mini glossary

| Term            | Meaning                                                                          |
| --------------- | -------------------------------------------------------------------------------- |
| MDI             | Multiple Document Interface – child windows inside a parent window. Outdated.    |
| Dock site       | Container that can accept docked windows (`DockSite = True`).                    |
| Dockable form   | Window that can be docked via drag & drop (`DragKind = dkDock`).                 |
| Floating        | The window is not docked; it is a regular top-level window.                      |
| Host dock site  | The dock site a form currently lives in; `nil` while floating.                   |
| Dock manager    | Arranges multiple children of a dock site (splitters, tabs).                     |
