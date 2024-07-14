import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../future/product/data/model/response_product/response_product.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  ///Product
  @POST(ApiConstants.products)
  Future<ResponseProduct> product();
}
