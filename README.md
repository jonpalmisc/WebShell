# WebShell

WebShell implements a shell/wrapper around a web application. Functionally,
it serves a similar purpose as Electron&mdash;to turn a web application into a
self-contained desktop application. However, WebShell uses WebKit under the
hood instead of Chromium, which should result in better performance,
increased responsiveness, and lower power consumption on macOS.

WebShell is NOT a complete project on its own! Right now it is more of an
experiemental starting point for properly wrapping a web application into a
desktop app using macOS-native technologies. The `Config.plist` file exposes
some of the main parameters you may be interested in tweaking, but some apps may
require additional changes.

## Building

Open the project in Xcode and just click build/run.

## Usage

Should be self-explanatory; more instructions to come.

## License

Copyright &copy; 2022 Jon Palmisciano. All rights reserved.

Licensed under the BSD 3-Clause license; see LICENSE.txt for more information.
