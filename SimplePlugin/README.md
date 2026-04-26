# SimplePlugin

A minimal Delphi IDE plugin based on the Open Tools API. The package registers a wizard, adds a menu item to the IDE's `Tools` menu, and shows a simple message when the item is clicked.

The demo is intentionally small. It lowers the entry barrier: in just a few lines you can see how a design-time package is structured, how `RegisterPackageWizard` is used, and how `INTAServices` gives access to the IDE main menu.

## What It Shows

- `SimplePlugin.dpk` is a `DESIGNONLY` package.
- The package requires `designide` because it uses the Open Tools API.
- `TSimplePlugin` implements `IOTAWizard` and `IOTANotifier`.
- `Register` calls `RegisterPackageWizard(TSimplePlugin.Create)`.
- The constructor adds a `Show Simple Message` menu item below `Tools`.

## Project Layout

```text
SimplePlugin/
├── SimplePlugin.dpk
├── SimplePlugin.dproj
└── SimplePlugin.Example.pas
```

## Getting Started

Open `SimplePlugin.dproj` in Delphi and build the package for Win32. Then install the package in the IDE. After installation, the `Tools` menu contains a `Show Simple Message` item.

When clicked, it shows:

```text
You clicked the Simple Plugin menu item!
```

## Interesting Code

- `ToolsAPI`: access to the Open Tools API.
- `INTAServices`: access to IDE services such as the main menu.
- `IOTAWizard.GetIDString`: unique wizard identifier.
- `IOTAWizard.GetName`: display name in the IDE.
- `RegisterPackageWizard`: registers the extension when the package is loaded.

## Things To Try

1. Change the menu text and the message.
2. Add the menu item to another IDE menu.
3. Add a submenu with multiple actions.
4. Use `IOTAModuleServices` to read information about the currently open project.
5. Remove the menu item cleanly in the destructor if you extend the logic.

## Requirements

- Delphi/RAD Studio for Windows.
- Access to `designide.dcp`.
- Installation as a design-time package in the IDE.

Because this demo extends the IDE, it should not be treated as a normal runtime application. It is built and installed, not simply launched with `Run`.
