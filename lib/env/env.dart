import 'env_dev.dart';
import 'env_production.dart';
import 'env_staging.dart';

enum Flavor { dev, staging, prod }

class Env {
  static late Flavor flavor;

  static String get baseUrl {
    switch (flavor) {
      case Flavor.dev:
        return EnvDev.baseUrl;
      case Flavor.staging:
        return EnvStaging.baseUrl;
      case Flavor.prod:
        return EnvProduction.baseUrl;
    }
  }
}
