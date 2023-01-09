import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:xmarket/data/data_source/base_model.dart';
import 'package:xmarket/data/models/Products.dart';
import 'package:xmarket/data/models/suggestions.dart';
import 'package:xmarket/data/repository/products_repo.dart';
import 'package:xmarket/presentation/utils/categories.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ProductsRepo _productsRepo;

  HomeBloc(this._productsRepo) : super(HomeState(homeProducts: [])) {
    on<CleanProducts>((event, emit) {
      emit(state.copyWith(homeProducts: []));
    });
    on<GetHomeProducts>((event, emit) async {
      List<BaseModel<Products>> homeProducts = state.homeProducts;
      try {
        var result =
        await _productsRepo.getProductsByCategory(event.category.id);
        if (result != null) {
          homeProducts.add(
              BaseModel.success(result.copyWith(category: event.category)));
        } else {
          homeProducts.add(BaseModel.failed());
        }
      } catch (e) {
        homeProducts.add(BaseModel.exception());
      }
      emit(state.copyWith(homeProducts: homeProducts));
    });
    on<GetSearchSuggestions>((event, emit) async {
      emit(state.copyWith(suggestions: BaseModel.loading()));
      try {
        var result = await _productsRepo.getSuggestions(event.query);
        if(result != null){
          emit(state.copyWith(suggestions: BaseModel.success(result)));
        }else{
          emit(state.copyWith(suggestions: BaseModel.failed()));
        }
      }catch(e){
        print(e);
        emit(state.copyWith(suggestions: BaseModel.exception()));
      }
    });
  }
}
