part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchProducts extends SearchEvent{
  String query;
  SearchProducts(this.query);
}
class GetProductsByCategory extends SearchEvent{
  int categoryId;
  GetProductsByCategory(this.categoryId);
}
class ClearEvent extends SearchEvent{
}
