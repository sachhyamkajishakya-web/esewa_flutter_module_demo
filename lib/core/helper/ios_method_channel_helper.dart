import 'dart:async';
import 'package:esewa_flutter_module/core/helper/uuid_hive_helper.dart';
import 'package:esewa_flutter_module/core/logger/logger.dart';
import 'package:esewa_flutter_module/domain/models/channel_data.dart';
import 'package:flutter/services.dart';

class IosMethodChannelHelper {
  static const _channel = MethodChannel('com.example.esewa_ios/config');
  static final _configCompleter = Completer<void>();

  static Future<void> init() async {
    _channel.setMethodCallHandler((call) async {
      switch (call.method) {
        case 'appConfig':
          final result = Map<String, dynamic>.from(call.arguments);
          final data = ChannelData.fromJson(result);
          logger.d(
            'DATA FROM METHOD CHANNEL -> ${data.uuid} ${data.environment}',
          );
          UuidHiveHelper.setEnvironment(data.environment);
          if (data.uuid != null) UuidHiveHelper.saveUuid(data.uuid!);
          if (!_configCompleter.isCompleted) {
            _configCompleter.complete();
          }

        default:
          throw PlatformException(code: 'NOT_IMPLEMENTED');
      }
    });

    // callback to ios for letting it know that flutter is ready
    await _channel.invokeMethod('flutterReady');

    //  wait until appConfig arrives
    await _configCompleter.future;
  }
}
