# dart_flight

![Version: 0.1.0](https://img.shields.io/badge/pub-v0.1.0-lightblue)
![Dart: 3.2.3](https://img.shields.io/badge/dart-v3.2.3-blue)
![License: GNU GPL v3](https://img.shields.io/badge/license-GNU%20GPL%20v3-yellow)

`dart_flight` is a lightweight application framework for the `Dart` language  
that enables rapid development and deployment of servers utilizing the  
Model-View-Controller (or MVC) architectural pattern to handle requests.

## Table Of Contents

- [dart\_flight](#dart_flight)
  - [Table Of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Getting Started](#getting-started)
  - [Change Log](#change-log)
    - [v0.1.0 - 2023.12.23](#v010---20231223)
  - [License](#license)

## Overview

_Disclaimer: `dart_flight` is still in an early development stage at this time  
and as such does not reflect any potential release product forthcoming._

`dart_flight` is a simple framework for creating web server applications using  
the MVC architectural pattern.

It started as a very simple hobby project of mine and has evolved into a more  
serious personal project. I originally just wanted to learn and better  
understand how other frameworks such as `Laravel` or `ASP.NET Core`, etc  
handle the basic concepts such as routing, rendering views, etc. I also  
wanted a better understanding of `Dart`, coming from a primarily `C#`  
background.

I have learned a lot so far with this project, and will continue to develop  
and grow `dart_flight` so long as I continue to both learn and have fun.

## Getting Started

_This section will be updated before a released product will be published._

## Change Log

_This change log / version history section will only include information about  
the latest released version / patch._  

_See the [change_log.md](./change_log.md) file for a full version history._

### v0.1.0 - 2023.12.23

- The application can do the following as of first 'version':
  - The app is instantiated, and config / env data is read into the container.
  - The app can also be configured from the instantiation call / invocation.
  - Once configured, the app establishes an `HttpServer` to listen for requests.
  - Once an `HttpRequest` is received, an `HttpResponse` can be written.

## License

[dart_flight](https://github.com/dartFlight) ::|||::
[whydaNox](https://github.com/whydaNox)  
Copyright (C) 2023, All Rights Reserved

This program is free software: you can redistribute it and/or modify it  
under the terms of the GNU General Public License as published by the Free  
Software Foundation, either version 3 of the License, or (at your option)  
any later version.

This program is distributed in the hope that it will be useful, but WITHOUT  
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS  
FOR A PARTICULAR PURPOSE.  
See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with  
this program.  If not, see <https://www.gnu.org/licenses/>.
