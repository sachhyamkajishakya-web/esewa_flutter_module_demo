import 'package:envied/envied.dart';

part 'env_staging.g.dart';

@Envied(path: 'lib/env/.env.stg')
abstract class EnvStaging {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _EnvStaging.baseUrl;

  @EnviedField(varName: 'API_KEY')
  static const String apiKey = _EnvStaging.apiKey;
}
