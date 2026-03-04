import 'package:dio/dio.dart';
import 'package:esewa_flutter_module/core/client/dio_client.dart';
import 'package:esewa_flutter_module/domain/models/product.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ProductListRemoteSource {
  final DioClient dio;

  ProductListRemoteSource({required this.dio});

  Future<List<Product>> getProducts() async {
    try {
      final response = await dio.client.get('/products');
      final products = response.data as List<dynamic>;
      return products.map((data) => Product.fromJson(data)).toList();
    } on DioException catch (_) {
      rethrow;
    }
  }
}
