import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:xmarket/data/repository/products_repo.dart';

import '../../../data/data_source/base_model.dart';
import '../../../data/models/product/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductsRepo _repo;
  ProductBloc(this._repo) : super(ProductState(productInfo: BaseModel.loading(),specsVisibility: false)) {
    on<GetProductInfo>((event, emit) async {
      emit(state.copyWith(productInfo: BaseModel.loading()));
      // try{
        var result = await _repo.getProductInfo(event.productId);
        if(result == null){
          emit(state.copyWith(productInfo: BaseModel.failed()));
        }else{
          emit(state.copyWith(productInfo: BaseModel.success(result)));
        }
      // }catch(e){
      //   print(e);
      //   emit(state.copyWith(productInfo: BaseModel.exception()));
      // }
    });
    on<ChangeSpecsVisibility>((event, emit) async {
      emit(state.copyWith(specsVisibility: !state.specsVisibility));
    });
    on<ClearEvent>((event, emit) async {
      emit(ProductState(productInfo: BaseModel.loading()));
    });
  }
}
