import 'dart:io';

import 'app.dart';

/// Enables the capability of creating and appending to various log files.
/// 
/// [Logger] stores a pre-determined collection of log file locations,
/// and upon static invocation can create (if they don't already exist) and
/// append to various log files at will.
class Logger {
  /// The collection of log file locations.
  static final Map<String, String> _logs = {
    'app': '${_logsPath}app.log',
    'debug': '${_logsPath}debug.log',
    'exception': '${_logsPath}exception.log',
  };

  /// The path to the `/logs` directory.
  static final String _logsPath = App.logPath;

  /// Logs a given [message] to a given [log] file.
  /// 
  /// [logMessage] checks if the given [log] file already exists first, and
  /// if it does then the file will append the [message] to the end.
  /// 
  /// If the file does not exist, it will be created, and then the [message]
  /// will be written to it.
  /// 
  /// All file writes will be prefaced with a machine-local timestamp.
  static Future<void> logMessage({
    required String log,
    required String message
  }) async {
    var logFile = File(_logs[log]!);
    if (_checkFileExists(logFile.path)) {
      var sink = logFile.openWrite(mode: FileMode.append);
      sink.writeln('${DateTime.now()} $message');
      await sink.flush();
      await sink.close();
    } else {
      var sink = logFile.openWrite();
      sink.writeln('${DateTime.now().toUtc()} $message');
      await sink.flush();
      await sink.close();
    }
  }

  /// Checks whether a given [file] exists.
  static bool _checkFileExists(String file) {
    return File(file).existsSync();
  }
}
