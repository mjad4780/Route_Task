import 'package:bloc/bloc.dart';
import 'package:route_task/future/product/data/repo/repo_product.dart';

import '../data/model/response_product/product.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._repoProduct) : super(const ProductState.initial());

  final RepoProduct _repoProduct;
  List<Product>? searchProduct = [];

//:Get Product
  emitAddAdress() async {
    emit(const ProductState.loading());
    final response = await _repoProduct.getProduct();
    response.when(success: (product) {
      emit(ProductState.success(product));
    }, failure: (error) {
      emit(ProductState.error(erorr: error.errorModel.errorMessage));
    });
  }

  //: Search
  void searchProducts(String? search, List<Product> product) {
    if (search!.isEmpty) {
      searchProduct = product;
    } else {
      searchProduct = product
          .where((title) =>
              title.title!.toLowerCase().contains(search.toLowerCase()))
          .toList();
      emit(ProductState.search(searchProduct));
    }
  }
}
