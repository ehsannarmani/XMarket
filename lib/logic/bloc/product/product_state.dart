part of 'product_bloc.dart';

class ProductState{
  BaseModel<Product> productInfo;
  bool specsVisibility;
  ProductState({required this.productInfo,this.specsVisibility = false});

  ProductState copyWith({BaseModel<Product>? productInfo,bool? specsVisibility}){
    return ProductState(productInfo: productInfo ?? this.productInfo,specsVisibility: specsVisibility ?? this.specsVisibility);
  }
}
