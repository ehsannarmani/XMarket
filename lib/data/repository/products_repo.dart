import 'dart:convert';

import 'package:xmarket/data/data_source/api.dart';
import 'package:xmarket/data/models/product/product.dart';
import 'package:xmarket/data/models/Products.dart';
import 'package:xmarket/data/models/search/Search.dart';
import 'package:xmarket/data/models/suggestions.dart';

class ProductsRepo{
  Api _api;
  ProductsRepo(this._api);

  Future<Products?> getProductsByCategory(int categoryId) async{
    var result = await _api.getProductsByCategory(categoryId);
    return result.statusCode == 200 ? Products.fromJson(result.data) : null;
  }
  Future<Product?> getProductInfo(String productId) async{
    var result = await _api.getProductInfo(productId);
    return result.statusCode == 200 ? Product.fromJson(result.data) : null;
  }
  Future<List<Suggestions>?> getSuggestions(String query) async{
    var result = await _api.getSuggestions(query);
    if(result.statusCode != 200){
      return null;
    }
    List<Suggestions> res = [];
    (result.data as List<dynamic>).forEach((element) {
      res.add(Suggestions.fromJson(element));
    });
    return res;
  }
  Future<Search?> searchProducts(String query) async{
    var result = await _api.searchProducts(query);
    return result.statusCode == 200 ? Search.fromJson(result.data) : null;
  }
}