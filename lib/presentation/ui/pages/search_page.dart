import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmarket/data/data_source/base_model.dart';
import 'package:xmarket/logic/bloc/search/search_bloc.dart';
import 'package:xmarket/presentation/ui/pages/main/product.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key, this.query,this.categoryId,this.categoryName}) : super(key: key);
  String? query;
  int? categoryId;
  String? categoryName;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    if(widget.query != null){
      BlocProvider.of<SearchBloc>(context).add(SearchProducts(widget.query!));
    }else{
      BlocProvider.of<SearchBloc>(context).add(GetProductsByCategory(widget.categoryId!));
    }
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    BlocProvider.of<SearchBloc>(context).add(ClearEvent());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.query == null ? "دسته بندی ${widget.categoryName}:" : "نتایج جستجو برای: ${widget.query}",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
        ),
        titleSpacing: 0,
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        buildWhen: (preState, newState) {
          return (preState.searchData != newState.searchData) || (preState.categoryProductData != newState.categoryProductData);
        },
        builder: (context, state) {
          if(state.searchData.status == ResponseStatus.Success || state.categoryProductData.status == ResponseStatus.Success){
            dynamic data;
            if(state.searchData.status == ResponseStatus.Success){
              data = state.searchData.data;
            }else{
              data = state.categoryProductData.data;
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                childAspectRatio: 7/13,
                crossAxisCount: 3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 10,
                children: List.generate(data.results?.length ?? 0, (index) {
                  var item = data.results![index];
                  return Product(
                    result: item,
                  );
                }),
              ),
            );
          }else if(state.searchData.status == ResponseStatus.Loading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return const Center(
              child: Text("عملیات با خطا مواجه شد"),
            );
          }
        },
      ),
    );
  }
}
