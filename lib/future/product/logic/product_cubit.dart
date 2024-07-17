import 'package:bloc/bloc.dart';
import 'package:route_task/core/get_it/get_it.dart';
import 'package:route_task/core/helpers/cache_helper.dart';
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
      emit(ProductState.error(erorr: error.errorModel.errorMessage));
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

  favorite(int id) {
    if (getIt<CacheHelper>().getData(key: 'id') == id) {
      getIt<CacheHelper>().removeData(key: 'id');
    } else {
      getIt<CacheHelper>().saveData(key: 'id', value: id);
    }
    emit(const ProductState.favorite());
  }
}
