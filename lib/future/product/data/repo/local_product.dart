import 'dart:convert';

import 'package:route_task/core/get_it/get_it.dart';
import 'package:route_task/future/product/data/model/response_product/product.dart';

import '../../../../core/errors/expentions.dart';
import '../../../../core/helpers/cache_helper.dart';

class CacheHelpers {
  static cacheproductsData(List<Product>? product) async {
    if (product != null) {
      String encodeJsonData = json.encode(
        product
            .map(
              (product) => product.toJson(),
            )
            .toList(),
      );
      getIt<CacheHelper>().setString(
        'product',
        encodeJsonData,
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  static Future<List<Product>> getCachedRocketsData() async {
    final cachedRockets = getIt<CacheHelper>().getData(key: 'product');
    List<Product> product = [];
    // if (cachedRockets != null) {
    List decodeJsonData = json.decode(cachedRockets);
    product = decodeJsonData
        .map(
          (json) => Product.fromJson(json),
        )
        .toList();
    return product;
    // } else {
    //   throw CacheExeption(errorMessage: "No Internet Connection");
    // }
  }
}
