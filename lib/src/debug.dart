// General debugging tools to help with developing applications,
// including this framework!

import 'dart:convert';

/// The [Debug] class containes various application development and
/// debugging tools specific to [dart_flight].
/// 
/// These tools may or may not be useful in helping speed up or improve the
/// development of your applications with the framework.
class Debug {
  /// Encodes the give [data] as a JSON object [String], and the prints it.
  static void jsonDump(Object data) {
    var jsonData = jsonEncode(data);

    print('jsonData: $jsonData');
  }
}
