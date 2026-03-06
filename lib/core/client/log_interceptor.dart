import 'package:dio/dio.dart';
import 'package:esewa_flutter_module/core/logger/logger.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d("REQUEST: ${options.method} ${options.uri}");
    logger.d("HEADERS: ${options.headers}");
    logger.d("BODY: ${options.data}");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d("RESPONSE: ${response.statusCode} ${response.requestOptions.uri}");
    logger.d("DATA: ${response.data}");
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e("ERROR: ${err.response?.statusCode}");
    logger.e("MESSAGE: ${err.message}");
    handler.next(err);
  }
}
