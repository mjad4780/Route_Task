import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

import '../../core/networking/api_service.dart';
import '../../core/networking/dio_factory.dart';
import '../helpers/cache_helper.dart';

final getIt = GetIt.instance;
void setupServise() {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerSingleton<CacheHelper>(CacheHelper());

  // login
  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
