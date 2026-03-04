import 'package:esewa_flutter_module/domain/models/product.dart';
import 'package:esewa_flutter_module/domain/repositories/product_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'product_list_state.dart';
part 'product_list_cubit.freezed.dart';

@injectable
class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit({required ProductListRepository repository})
    : _repository = repository,
      super(ProductListState.initial());

  final ProductListRepository _repository;

  Future<void> fetchProducts() async {
    try {
      emit(ProductListState.loading());
      final products = await _repository.getProducts();
      emit(ProductListState.success(products));
    } catch (error) {
      emit(ProductListState.error(error.toString()));
    }
  }
}
