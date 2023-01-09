part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetHomeProducts extends HomeEvent{
  Category category;
  GetHomeProducts(this.category);
}
class GetSearchSuggestions extends HomeEvent{
  String query;
  GetSearchSuggestions(this.query);
}
class CleanProducts extends HomeEvent{}
