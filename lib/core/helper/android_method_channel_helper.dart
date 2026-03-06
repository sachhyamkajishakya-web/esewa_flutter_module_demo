// core/services/app_config_service.dart
import 'package:esewa_flutter_module/domain/models/channel_data.dart';
import 'package:flutter/services.dart';

class AndroidMethodChannelHelper {
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
    }

    // cache UUID locally
  }
}
