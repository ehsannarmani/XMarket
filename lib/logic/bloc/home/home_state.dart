part of 'home_bloc.dart';

class HomeState{
  List<BaseModel<Products>> homeProducts;
  BaseModel<List<Suggestions>>? suggestions;

  HomeState({required this.homeProducts,this.suggestions});

  HomeState copyWith({List<BaseModel<Products>>? homeProducts,BaseModel<List<Suggestions>>? suggestions}){
    return HomeState(homeProducts: homeProducts ?? this.homeProducts,suggestions: suggestions ?? this.suggestions);
  }
}
