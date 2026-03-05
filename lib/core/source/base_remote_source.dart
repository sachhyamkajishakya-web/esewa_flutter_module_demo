import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_network_interceptor/dio_network_interceptor.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class BaseRemoteSource {
  Future<Either<NetworkException, T>> safeApiCall<T>(
    Future<Response> Function() apiCall,
    T Function(dynamic data) parser,
  ) async {
    try {
      final response = await apiCall();

      return Right(parser(response.data));
    } on DioException catch (e) {
      NetworkException error;

      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          error = NetworkException(
            type: NetworkErrorType.timeout,
            message: 'Connection timed out!',
          );
          break;

        case DioExceptionType.connectionError:
          error = NetworkException(
            type: NetworkErrorType.noInternet,
            message: 'Some issue with your internet connection!',
          );
          break;

        case DioExceptionType.badResponse:
          if (e.response?.statusCode != null) {
            if (e.response!.statusCode == 401) {
              error = NetworkException(
                type: NetworkErrorType.serverError,
                message: 'Unauthroized request!',
              );
            } else if (e.response!.statusCode == 403) {
              error = NetworkException(
                type: NetworkErrorType.serverError,
                message: 'Access denied!',
              );
            } else if (e.response!.statusCode == 404) {
              error = NetworkException(
                type: NetworkErrorType.serverError,
                message: 'Resource not found!',
              );
            } else if (e.response!.statusCode == 429) {
              error = NetworkException(
                type: NetworkErrorType.serverError,
                message: 'Too many request!',
              );
            } else if (e.response!.statusCode == 500) {
              error = NetworkException(
                type: NetworkErrorType.serverError,
                message: 'Internal server error!',
              );
            } else {
              error = NetworkException(
                type: NetworkErrorType.serverError,
                message: 'Something went wrong!',
              );
            }
          } else {
            error = NetworkException(
              type: NetworkErrorType.serverError,
              message: 'Something went wrong!',
            );
          }

          break;

        case DioExceptionType.cancel:
          error = NetworkException(
            type: NetworkErrorType.cancelled,
            message: 'Request cancelled!',
          );
          break;

        default:
          error = NetworkException(
            type: NetworkErrorType.unknown,
            message: 'Something went wrong!',
          );
      }

      return Left(error);
    }
  }
}
