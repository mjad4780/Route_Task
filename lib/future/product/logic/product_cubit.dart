import 'package:bloc/bloc.dart';

import 'package:route_task/future/product/data/repo/repo_product.dart';

import '../data/model/response_product/product.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._repoProduct) : super(const ProductState.initial());

  final RepoProduct _repoProduct;
  List<Product>? products = [];

//:Get Product
  getproduct() async {
    emit(const ProductState.loading());
    final response = await _repoProduct.getProduct();
    response.when(success: (product) {
      products = product;
      print('object${product![1].images}');
      emit(ProductState.success(product));
    }, failure: (error) {
      emit(ProductState.error(erorr: error.failerCache!));
    });
  }

  //: Search
  void searchProducts(
    String? search,
  ) {
    final searchData = products!
        .where((title) =>
            title.title!.toLowerCase().startsWith(search!.toLowerCase()))
        .toList();
    emit(ProductState.search(searchData));
  }
}
