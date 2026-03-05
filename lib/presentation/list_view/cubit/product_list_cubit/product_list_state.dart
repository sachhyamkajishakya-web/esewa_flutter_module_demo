part of 'product_list_cubit.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState.initial() = _Initial;

  const factory ProductListState.loading() = _Loading;

  const factory ProductListState.success(List<Product> products) = _Success;

  const factory ProductListState.error(String message) = _Error;
}
