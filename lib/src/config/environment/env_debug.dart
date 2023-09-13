import 'package:envied/envied.dart';
import 'package:github_discover/src/config/environment/app_env.dart';
import 'package:github_discover/src/config/environment/app_env_fields.dart';

part 'env_debug.g.dart';

@Envied(name: 'Env', path: '.env.debug')
class EnvDebug implements AppEnv, AppEnvFields {
  const EnvDebug();

  @override
  @EnviedField(varName: 'BASE_URL')
  final String baseUrl = _Env.baseUrl;
}
