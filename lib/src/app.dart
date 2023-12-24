import 'dart:io';

import 'package:dotenv/dotenv.dart';
import 'package:yaml/yaml.dart';

import 'logger.dart';

/// The [App] class is the core of a [dart_flight] application.
///
/// It acts as the global container for application configuration data.<br />
/// It also serves an [HttpServer] and forwards [HttpRequest]s to a [Router].
class App {
  /// The absolute path of the application root.
  static final String appRootPath = _findRootPath();

  /// The path of the application `config/` directory.
  static final String configPath = '${appRootPath}lib/config/';

  /// The path of the application `log/` directory.
  static final String logPath = '${appRootPath}log/';

  /// The path of the application 'www/' directory.
  static final String wwwPath = '${appRootPath}www/';

  /// The global application configuration variables container.
  static late final Map _appConfig;

  /// The global environment variables container.
  static late final DotEnv _envConfig;

  /// [App] constructor that allows for configuration before instantiation.
  ///
  /// [addConfigurationData] loads a `.yaml` config file into the [_appConfig].
  /// <br />
  /// [addEnvironmentData] loads a `.env` config file into the [_envConfig].
  App.build({
    bool addConfigurationData = false,
    bool addEnvironmentData = false,
    String? serverAddress,
    String? serverPort,
  }) {
    //
    if (addConfigurationData) _addConfigurationData();
    if (addEnvironmentData) _addEnvironmentData();
    if (serverAddress == null) _appConfig['server_address'] = 'localhost';
    if (serverPort == null) _appConfig['server_port'] = '8181';
  }

  /// Retrieve a value associated with a [key] from the [_appConfig] container.
  static dynamic config(String key) => _appConfig[key];

  /// Retrieve a value from the [_envConfig] container associated with a [key].
  static String env(String key) => _envConfig[key].toString();

  /// Listen for HTTP requests.
  ///
  /// Each [HttpRequest] is then forwarded to a [Router] to be resolved.
  void serve() async {
    try {
      HttpServer server = await HttpServer.bind(
          _appConfig['server_address'],
          _appConfig['server_port']
        );

      await for (HttpRequest request in server) {
        //
        request.response.write('Yay, it works!');
        request.response.close();
      }

      server.close();
    } catch (_) {
      Logger.logMessage(log: 'exception', message: _.toString());
    }
  }

  /// Loads the application configuration varables from the `config.yaml` file.
  void _addConfigurationData() {
    String configFilePath = '${configPath}config.yaml';
    File configFile = File(configFilePath);
    String yamlString = configFile.readAsStringSync();
    _appConfig = loadYaml(yamlString);
  }

  /// Loads the environment variables from the `.env` file.
  void _addEnvironmentData() {
    String envPath = '$configPath.env';
    _envConfig = DotEnv()..load([envPath]);
  }
  
  /// Determines the root path of the application.
  static String _findRootPath() {
    if (Platform.isWindows) {
      // Returns the correct Windows OS absolute path to the application root.
      return Uri.base.path.toString().substring(1);
    } else {
      // Returns the correct Unix-like OS absolute path to the application root.
      return Uri.base.path.toString();
    }
  }
}
