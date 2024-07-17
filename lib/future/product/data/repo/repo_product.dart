import 'package:route_task/future/product/data/model/response_product/product.dart';
import 'package:route_task/future/product/data/repo/local_product.dart';

import '../../../../core/errors/expentions.dart';
import '../../../../core/get_it/get_it.dart';
import '../../../../core/helpers/cache_helper.dart';
import '../../../../core/helpers/network_info.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';

class RepoProduct {
  final ApiService _apiService;
  final NetworkInfo networkInfo;
  RepoProduct(
    this._apiService,
    this.networkInfo,
  );

  /// :GetProduct

  Future<ApiResult<List<Product>?>> getProduct() async {
    if (await networkInfo.isConnected!) {
      try {
        final response = await _apiService.product();
        if (getIt<CacheHelper>().getData(key: 'product') == null) {
          await CacheHelpers.cacheproductsData(response.products);
        }
        return ApiResult.success(response.products);
      } catch (e) {
        return ApiResult.failure(ErrorHandler.handle(e));
      }
    } else {
      try {
        final product = await CacheHelpers.getCachedRocketsData();
        print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb$product');
        return ApiResult.success(product);
      } catch (e) {
        return ApiResult.failure(
            ErrorHandler.handle(e, "No Internet Connection"));
      }
    }
  }
}
