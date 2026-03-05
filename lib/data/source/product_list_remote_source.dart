import 'package:dartz/dartz.dart';
import 'package:dio_network_interceptor/dio_network_interceptor.dart';
import 'package:esewa_flutter_module/core/client/dio_client.dart';
import 'package:esewa_flutter_module/core/source/base_remote_source.dart';
import 'package:esewa_flutter_module/domain/models/product.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ProductListRemoteSource extends BaseRemoteSource {
  final DioClient dio;

  ProductListRemoteSource({required this.dio});

  Future<Either<NetworkException, List<Product>>> getProducts() async {
    return safeApiCall(
      () => dio.client.get('/posts'),
      (data) => (data as List).map((e) => Product.fromJson(e)).toList(),
    );
  }
}
