import 'package:dio/dio.dart';
import 'package:esewa_flutter_module/core/helper/android_method_channel_helper.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final AndroidMethodChannelHelper channelHelper;

  AuthInterceptor(this.channelHelper);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final uuid = channelHelper.getSavedUUID();

    options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'UUID': ?uuid,
    });
    handler.next(options);
  }
}
