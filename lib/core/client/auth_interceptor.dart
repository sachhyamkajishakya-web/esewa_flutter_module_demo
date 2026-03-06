import 'package:dio/dio.dart';
import 'package:esewa_flutter_module/core/helper/uuid_hive_helper.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final uuid = UuidHiveHelper.getSavedUUID();

    options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'UUID': ?uuid,
    });
    handler.next(options);
  }
}
