import 'package:dartz/dartz.dart';
import 'package:dio_network_interceptor/dio_network_interceptor.dart';
import 'package:esewa_flutter_module/domain/models/product.dart';

abstract class ProductListRepository {
  Future<Either<NetworkException, List<Product>>> getProducts();
}
