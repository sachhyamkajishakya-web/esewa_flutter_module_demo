import 'package:esewa_flutter_module/data/source/product_list_remote_source.dart';
import 'package:esewa_flutter_module/domain/models/product.dart';
import 'package:esewa_flutter_module/domain/repositories/product_list_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductListRepository)
class ProductListRepositoryImpl implements ProductListRepository {
  final ProductListRemoteSource _remoteSource;

  ProductListRepositoryImpl(this._remoteSource);
  @override
  Future<List<Product>> getProducts() async {
    return await _remoteSource.getProducts();
  }
}
