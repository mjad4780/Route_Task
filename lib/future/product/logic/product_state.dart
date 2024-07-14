import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:route_task/future/product/data/model/response_product/product.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;

  /// getproduct
  const factory ProductState.loading() = Loading;
  const factory ProductState.success(List<Product>? responseProduct) = Success;
  const factory ProductState.error({required String erorr}) = Error;

  //search
  const factory ProductState.search(List<Product>? responseProduct) = Search;
}
