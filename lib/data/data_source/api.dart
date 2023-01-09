
import 'package:dio/dio.dart';
import 'package:xmarket/presentation/utils/routes.dart';

class Api{
  Dio _dio;
  Api(this._dio);

  dynamic getProductsByCategory(int categoryId) async{
    var response = await _dio.get(Routes.getByCategory(categoryId));
    return response;
  }

  dynamic getProductInfo(String productId) async{
    var response = await _dio.get(Routes.getProductInfo(productId));
    return response;
  }

  dynamic getSuggestions(String query) async{
    var response = await _dio.get(Routes.getSuggestions(query));
    return response;
  }
  dynamic searchProducts(String query) async{
    var response = await _dio.get(Routes.searchProducts(query));
    return response;
  }
}