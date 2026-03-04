import 'package:esewa_flutter_module/domain/models/product.dart';

abstract class ProductListRepository {
  Future<List<Product>> getProducts();
}
