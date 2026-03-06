import 'package:envied/envied.dart';

part 'env_production.g.dart';

@Envied(path: 'lib/env/.env.prod')
abstract class EnvProduction {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _EnvProduction.baseUrl;

  @EnviedField(varName: 'API_KEY')
  static const String apiKey = _EnvProduction.apiKey;
}
