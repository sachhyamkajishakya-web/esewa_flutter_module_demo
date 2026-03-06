import 'package:esewa_flutter_module/core/constants/hive_constants.dart';
import 'package:esewa_flutter_module/env/env.dart';
import 'package:hive/hive.dart';

class UuidHiveHelper {
  static final _box = Hive.box<String>('uuid_box');

  static void saveUuid(String uuid) => _box.put(HiveConstants.uuidKEY, uuid);

  static String? getSavedUUID() => _box.get(HiveConstants.uuidKEY);

  static void setEnvironment(String environment) {
    switch (environment) {
      case 'develop':
        Env.flavor = Flavor.dev;
        break;
      case 'stage':
        Env.flavor = Flavor.staging;
        break;
      case 'production':
        Env.flavor = Flavor.prod;
        break;
    }
  }
}
