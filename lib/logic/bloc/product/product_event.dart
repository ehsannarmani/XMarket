part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetProductInfo extends ProductEvent{
  String productId;
  GetProductInfo(this.productId);
}
class ChangeSpecsVisibility extends ProductEvent{
}
class ClearEvent extends ProductEvent{}
