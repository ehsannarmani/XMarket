part of 'search_bloc.dart';

class SearchState{
  BaseModel<Search> searchData;
  BaseModel<Products> categoryProductData;
  SearchState({required this.searchData,required this.categoryProductData});

  SearchState copyWith({ BaseModel<Search>? searchData, BaseModel<Products>? categoryProductData}){
    return SearchState(searchData: searchData ?? this.searchData,categoryProductData: categoryProductData ?? this.categoryProductData);
  }
}
