import 'dart:convert';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xmarket/data/data_source/base_model.dart';
import 'package:xmarket/data/models/suggestions.dart';
import 'package:xmarket/data/repository/products_repo.dart';
import 'package:xmarket/logic/bloc/search/search_bloc.dart';
import 'package:xmarket/presentation/ui/pages/search_page.dart';
import 'package:xmarket/presentation/utils/navigator.dart';

import '../../../../di.dart';
import '../../../../logic/bloc/home/home_bloc.dart';
import '../../../../logic/bloc/product/product_bloc.dart';

class Header extends StatelessWidget {
  Header({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: 230,
      decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15))),
      child: Wrap(
        runAlignment: WrapAlignment.end,
        alignment: WrapAlignment.center,
        children: [
          Text(
            "ایکس مارکت",
            style: theme.textTheme.headline1?.copyWith(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 35),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            color: theme.primaryColorLight,
                            borderRadius: BorderRadius.circular(7)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TypeAheadField(

                            textFieldConfiguration: TextFieldConfiguration(
                            controller: searchController,
                              style:  theme.textTheme.subtitle1
                                  ?.copyWith(color: Colors.white),

                              decoration: InputDecoration(
                                  hintText: "جستجو",
                                  hintStyle: theme.textTheme.subtitle1
                                      ?.copyWith(color: Colors.white),
                                  border: InputBorder.none),
                              cursorColor: Colors.white,
                            ),
                            suggestionsCallback: (value) async {
                              if(searchController.text.isEmpty){
                                return [];
                              }
                              ProductsRepo productRepo = locator();
                              var result =  await productRepo.getSuggestions(searchController.text);
                              print(result);
                              if(result == null){
                                return [];
                              }else{
                                return result;
                              }
                            },
                            onSuggestionSelected: (suggestion) {
                              var data = suggestion as Suggestions;
                              NavigatorHelper.key?.currentState?.push(
                                PageTransition(
                                  child: SearchPage(query: data.text!),
                                  type: PageTransitionType.fade
                                )
                              );
                            },
                            itemBuilder: (BuildContext context, itemData) {
                              var data = itemData as Suggestions;
                              if(data.category?.title == null){
                                return ListTile(
                                  title: Text(data.text!,style: TextStyle(fontSize: 13,color: Colors.white),),
                                );
                              }else{
                                return ListTile(
                                  title: Text(data.text!,style: TextStyle(fontSize: 13,color: Colors.white),),
                                  subtitle: Text("در دسته ${data.category!.title!}",style: TextStyle(fontSize: 12,color: Colors.grey.shade400),),
                                );
                              }
                            },
                            suggestionsBoxDecoration: SuggestionsBoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: theme.primaryColorLight
                            ),
                            hideOnEmpty: true,
                            hideOnError: true,
                            hideSuggestionsOnKeyboardHide: false,
                            keepSuggestionsOnLoading: false,
                            noItemsFoundBuilder: (ctx){
                              return Text("موردی یافت نشد!");
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        if(searchController.text.isNotEmpty){
                          NavigatorHelper.key?.currentState?.push(
                              PageTransition(
                                  child: SearchPage(query: searchController.text),
                                  type: PageTransitionType.bottomToTop
                              )
                          );
                        }
                      },
                      splashColor: Colors.white,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: theme.primaryColorLight,
                            borderRadius: BorderRadius.circular(7)),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
