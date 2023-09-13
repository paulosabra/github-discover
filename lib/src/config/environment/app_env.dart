import 'package:github_discover/src/config/environment/app_env_fields.dart';
import 'package:github_discover/src/config/environment/env_debug.dart';

abstract class AppEnv implements AppEnvFields {
  factory AppEnv() => _instance;
  static const AppEnv _instance = EnvDebug();
}
