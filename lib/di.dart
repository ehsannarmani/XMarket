import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:xmarket/data/data_source/api.dart';
import 'package:xmarket/data/repository/products_repo.dart';
import 'package:xmarket/logic/bloc/home/home_bloc.dart';
import 'package:xmarket/logic/bloc/main/main_bloc.dart';
import 'package:xmarket/logic/bloc/search/search_bloc.dart';

import 'logic/bloc/product/product_bloc.dart';

GetIt locator = GetIt.instance;

void setup(){

  //dio
  var dio = Dio();
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient dioClient){
    dioClient.badCertificateCallback = ((X509Certificate cert,String host,int port)=>true);
    return dioClient;
  };
  locator.registerSingleton(dio);

  //api
  locator.registerSingleton(Api(locator()));

 //repositories
  locator.registerSingleton(ProductsRepo(locator()));

  //blocs
  locator.registerSingleton(MainBloc());
  locator.registerSingleton(HomeBloc(locator()));
  locator.registerSingleton(ProductBloc(locator()));
  locator.registerSingleton(SearchBloc(locator()));
}