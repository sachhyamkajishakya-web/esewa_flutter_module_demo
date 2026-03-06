import 'package:dio/dio.dart';
import 'package:esewa_flutter_module/core/client/auth_interceptor.dart';
import 'package:esewa_flutter_module/core/client/log_interceptor.dart';
import 'package:esewa_flutter_module/env/env.dart';
import 'package:injectable/injectable.dart';

@singleton
class DioClient {
  late final Dio _dio;

  DioClient(
    AuthInterceptor authInterceptor,
    LoggingInterceptor logInterceptor,
  ) {
    _dio = Dio(
      BaseOptions(
        baseUrl: Env.baseUrl,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000),
      ),
    );

    _dio.interceptors.addAll([authInterceptor, logInterceptor]);
  }

  Dio get client => _dio;
}
