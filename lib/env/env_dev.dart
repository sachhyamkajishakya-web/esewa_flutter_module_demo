import 'package:envied/envied.dart';

part 'env_dev.g.dart';

@Envied(path: 'lib/env/.env.dev')
abstract class EnvDev {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _EnvDev.baseUrl;

  @EnviedField(varName: 'API_KEY')
  static const String apiKey = _EnvDev.apiKey;
}
