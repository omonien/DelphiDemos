# Docked Windows

This VCL demo shows dockable tool windows as a modern alternative to the classic MDI approach. It deliberately avoids database access, business logic, and third-party components so the docking mechanics stay front and center.

The idea: a normal main form provides dock zones on the left, right, and bottom. Three separate forms can be docked into those zones, dragged out, used as floating windows, and docked again.

## Why This Demo Is Interesting

Many older VCL applications still use MDI (`fsMDIForm` and `fsMDIChild`), even though modern desktop applications usually behave differently: tool windows, document tabs, movable panels, and good multi-monitor support are more familiar to users.

The VCL docking framework already provides the essential pieces:

- Dock zones are normal controls with `DockSite = True`.
- `UseDockManager = True` allows stacked or tab-like docking layouts.
- Dockable windows are regular `TForm` instances with `DragKind = dkDock` and `DragMode = dmAutomatic`.
- `ManualDock` sets or restores an initial layout.
- `HostDockSite` tells you whether a window is currently docked or floating.

## Project Layout

```text
DockedWindows/
├── DockedWindows.dpr
├── DockedWindows.dproj
├── DockedWindows.Main.Form.pas/.dfm
├── DockedWindows.Toolbox.Form.pas/.dfm
├── DockedWindows.Properties.Form.pas/.dfm
└── DockedWindows.Log.Form.pas/.dfm
```

## Getting Started

Open `DockedWindows.dproj` in Delphi and run the project. On startup, the main form docks the three tool windows into an initial layout:

- `Toolbox` on the left
- `Properties` on the right
- `Log` at the bottom

The middle panel remains available as the workspace. The menu and toolbar can show or hide the tool windows. `View > Reset layout` restores the initial arrangement.

## Interesting Code

- `DockedWindows.Main.Form.pas`: initial layout, `ShowToolForm`, menu actions, and logging.
- `PanelLeft`, `PanelRight`, `PanelBottom`: dock sites with splitters.
- `DockedWindows.Toolbox.Form.*`: a small tool window with action buttons.
- `DockedWindows.Properties.Form.*`: an object-inspector-style grid.
- `DockedWindows.Log.Form.*`: a log window docked at the bottom.
- `FormClose`: sets `Action := caHide`, so closing hides a tool window instead of freeing it.

## Things To Try

1. Drag a tool window out of a dock zone by its title bar.
2. Dock it back to the left, right, or bottom.
3. Drag one window onto an already docked window to test stacked docking.
4. Move a floating window to a second monitor.
5. Close a tool window and bring it back through `View`.
6. Use `Reset layout` to restore the initial arrangement.

## Possible Next Steps

- Save the docking layout and restore it on the next startup.
- Use a custom dock manager for more modern drop hints and visuals.
- Add a `TPageControl` to the workspace for tabbed documents.
- Create tool windows dynamically instead of relying on global auto-created forms.

## Requirements

- Delphi/RAD Studio for Windows.
- VCL. No third-party components.
