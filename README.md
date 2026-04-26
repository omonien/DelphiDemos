# Delphi Demos

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
![Delphi](https://img.shields.io/badge/Delphi-RAD%20Studio-red)
![VCL](https://img.shields.io/badge/UI-VCL-blue)
![Platform](https://img.shields.io/badge/Platform-Windows-lightgrey)
![Focus](https://img.shields.io/badge/Focus-Learning%20Demos-orange)

A small collection of Delphi demos created for events, webinars, and experiments. The projects are intentionally compact: each demo focuses on one practical building block that you can study, run, and adapt for real VCL applications.

The repository is aimed at Delphi developers who enjoy learning from working code: database access with FireDAC, reporting, UDP communication, IDE extensions, and modern dockable user interfaces.

## Contents

| Demo | Topic | Start here |
| --- | --- | --- |
| [Database Starter](Database%20Starter/) | FireDAC, SQLite, DataModule, DBGrid | `Database Starter/source/Company.dproj` |
| [Reporting Starter](Reporting%20Starter/) | FastReport, master/detail data, PDF export | `Reporting Starter/source/Company.dproj` |
| [UDP](UDP/) | Local UDP communication with Indy | `UDP/UDPDemo.groupproj` |
| [SimplePlugin](SimplePlugin/) | Delphi IDE extension with the Open Tools API | `SimplePlugin/SimplePlugin.dproj` |
| [DockedWindows](DockedWindows/) | Dockable VCL tool windows as an alternative to MDI | `DockedWindows/DockedWindows.dproj` |

## What To Expect

- **Small, focused projects** instead of large framework-style samples.
- **Classic VCL examples** that are useful for learning, demos, workshops, and experiments.
- **Delphi-native structure** with forms, DataModules, components, and `.dfm` design-time configuration.
- **Real desktop application topics**: showing data, generating reports, sending network packets, extending the IDE, and building flexible window layouts.

## Requirements

These are Delphi/RAD Studio projects for Windows. Depending on the demo, they use built-in or bundled Delphi technologies:

- FireDAC with SQLite support for the database and reporting demos.
- Indy for the UDP demo.
- FastReport for the reporting demo.
- `designide` and the Open Tools API for the IDE plugin.

The best starting point is the README inside each demo directory. Each one explains what the demo teaches, which project file to open, and what to try at runtime.

## Notes

- The database demos include a `northwind.sqlite` file. The project files copy it to the output directory via a post-build event if it is not already there.
- The Docked Windows demo is new and intentionally demonstrates a modern VCL docking approach instead of MDI.
- These samples are learning material. They are small enough to read comfortably and open-ended enough to become your own experiments.

## License

MIT License, see [LICENSE](LICENSE).
