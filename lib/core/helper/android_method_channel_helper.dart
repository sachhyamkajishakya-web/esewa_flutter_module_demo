import 'package:esewa_flutter_module/core/constants/hive_constants.dart';
import 'package:esewa_flutter_module/domain/models/channel_data.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AndroidMethodChannelHelper {
  static final _box = Hive.box<String>('uuid_box');

  static const _channel = MethodChannel('com.example.esewa/config');

  static ChannelData? _cachedConfig;

  static ChannelData get config {
    assert(
      _cachedConfig != null,
      'AppConfig not initialized. Call init() first.',
    );
    return _cachedConfig!;
  }

  static Future<void> init() async {
    final result = await _channel.invokeMapMethod<String, dynamic>('getConfig');
    if (result != null) {
      final data = ChannelData.fromJson(result);
      if (data.uuid != null) _cacheUUID(data.uuid!);
    }
  }

  static void _cacheUUID(String uuid) => _box.put(HiveConstants.uuidKEY, uuid);

  static String? getSavedUUID() => _box.get(HiveConstants.uuidKEY);
}
