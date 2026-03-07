import 'package:esewa_flutter_module/core/helper/uuid_hive_helper.dart';
import 'package:esewa_flutter_module/core/logger/logger.dart';
import 'package:esewa_flutter_module/domain/models/channel_data.dart';
import 'package:esewa_flutter_module/domain/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AndroidMethodChannelHelper {
  final UuidHiveHelper uuidHiveHelper;
  AndroidMethodChannelHelper(this.uuidHiveHelper);

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
      if (data.uuid != null) UuidHiveHelper.saveUuid(data.uuid!);
      UuidHiveHelper.setEnvironment(data.environment);
      logger.d('DATA FROM METHOD CHANNEL -> ${data.uuid} ${data.environment}');
    }
  }

  static Future<void> sendSelectedItemAndGoBack(Product product) async {
    try {
      await _channel.invokeMethod('selectedItem', {
        'id': product.id.toString(),
        'title': product.title,
        'price': product.price.toStringAsFixed(2),
        'description': product.description,
        'category': product.category,
        'rating': product.rating.rate.toStringAsFixed(2),
        'image': product.image,
      });
    } catch (e) {
      debugPrint('error sending selectedItem to ios native app: $e');
    }
  }
}
