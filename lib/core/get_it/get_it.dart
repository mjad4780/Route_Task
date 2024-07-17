import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:route_task/future/product/data/repo/repo_product.dart';
import 'package:route_task/future/product/logic/product_cubit.dart';

import '../../core/networking/api_service.dart';
import '../../core/networking/dio_factory.dart';
import '../helpers/cache_helper.dart';
import '../helpers/network_info.dart';

final getIt = GetIt.instance;
void setupServise() {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<DataConnectionChecker>(DataConnectionChecker());
  getIt.registerSingleton<NetworkInfoImpl>(
      NetworkInfoImpl(getIt<DataConnectionChecker>()));

  //product
  getIt.registerLazySingleton<RepoProduct>(
      () => RepoProduct(getIt(), getIt<NetworkInfoImpl>()));
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt()));
}
