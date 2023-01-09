import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:xmarket/data/models/search/Search.dart';
import 'package:xmarket/data/repository/products_repo.dart';

import '../../../data/data_source/base_model.dart';
import '../../../data/models/Products.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  ProductsRepo _repo;
  SearchBloc(this._repo) : super(SearchState(searchData: BaseModel.loading(),categoryProductData: BaseModel.loading())) {
    on<SearchProducts>((event, emit) async {
      emit(state.copyWith(searchData: BaseModel.loading()));
      try{
        var result = await _repo.searchProducts(event.query);
        if(result == null){
          emit(state.copyWith(searchData: BaseModel.failed()));
        }else{

          emit(state.copyWith(searchData: BaseModel.success(result)));
        }
      }catch(e){
        emit(state.copyWith(searchData: BaseModel.exception()));
      }
    });
    on<GetProductsByCategory>((event, emit) async {
      emit(state.copyWith(searchData: BaseModel.loading()));
      try{
        var result = await _repo.getProductsByCategory(event.categoryId);
        if(result == null){
          emit(state.copyWith(searchData: BaseModel.failed()));
        }else{
          emit(state.copyWith(categoryProductData: BaseModel.success(result)));
        }
      }catch(e){
        emit(state.copyWith(searchData: BaseModel.exception()));
      }
    });
    on<ClearEvent>((event, emit) async {
      emit(SearchState(searchData: BaseModel.loading(), categoryProductData: BaseModel.loading()));
    });
  }
}
