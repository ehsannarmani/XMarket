import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xmarket/data/data_source/base_model.dart';
import 'package:xmarket/logic/bloc/home/home_bloc.dart';
import 'package:xmarket/logic/bloc/main/main_bloc.dart';
import 'package:xmarket/presentation/ui/pages/category_page.dart';
import 'package:xmarket/presentation/ui/pages/main/header.dart';
import 'package:xmarket/presentation/ui/pages/main/product.dart';
import 'package:xmarket/presentation/ui/pages/product_page.dart';
import 'package:xmarket/presentation/utils/categories.dart';
import 'package:xmarket/presentation/utils/custom_colors.dart';
import 'package:xmarket/presentation/utils/navigator.dart';

import '../../../../data/models/Products.dart';

class BottomBarItem{
  String title;
  IconData icon;
  BottomBarItem(this.title,this.icon);
}
class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  PageController pageController = PageController();

  List<BottomBarItem> bottomBarItems = [
    BottomBarItem("ویترین", Icons.home),
    BottomBarItem("دسته بندی ها", Icons.category),
    BottomBarItem("ذخیره شده ها", Icons.bookmarks),
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: BlocBuilder<MainBloc,MainState>(
        builder: (context,state){
          return FlashyTabBar(
            selectedIndex: state.bottomBarIndex,
            showElevation: true,
            onItemSelected: (index){
              BlocProvider.of<MainBloc>(context).add(UpdateBottomBar(index));
              pageController.animateToPage(index,duration: Duration(milliseconds: 400),curve: Curves.linear);
            },
            items: List.generate(bottomBarItems.length, (index) {
              var item = bottomBarItems[index];
              return FlashyTabBarItem(
                  icon: Icon(item.icon),
                  title: Text(item.title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),),
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey.shade400
              );
            }),
            backgroundColor: theme.primaryColor,
            animationDuration: Duration(milliseconds: 200),

          );
        },
      ),
      body: PageView(
        controller: pageController,
        children: [
          HomePage(),
          CategoryPage(),
          HomePage(),
        ],
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BuildContext? ctx;
  @override
  void initState() {
    super.initState();

    HomeBloc homeBloc = BlocProvider.of(context);
    homeBloc.add(CleanProducts());
    List<Category> categories = ProductCategories.mainCategories;
    categories.forEach((element) {
      homeBloc.add(GetHomeProducts(element));
    });

    var platform = MethodChannel("ir.xmarket.channel");
    platform.invokeMethod("deeplink").then((value){
      if(value != null){
        NavigatorHelper.key?.currentState?.push(
          PageTransition(
            child: ProductPage(productId: value,),
            type: PageTransitionType.bottomToTop
          )
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    ctx = context;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body:Column(
        children: [
          Header(),
          BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (preState,newState){
              return preState.homeProducts.map((e) => e.status) != preState.homeProducts.map((e) => e.status);
            },
            builder: (context, state) {
              if (state.homeProducts.isEmpty) {
                return Expanded(
                  child: Center(child: CircularProgressIndicator(color: CustomColors.red500,),),
                );
              } else {
                List<BaseModel<Products>> data = state.homeProducts
                    .where((element) =>
                element.status == ResponseStatus.Success ||
                    element.status == ResponseStatus.Loading)
                    .toList();
                return Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      data.sort((a, b)=>a.data.category!.sort.compareTo(b.data.category!.sort));
                      List<Results> results = data[index].data.results!;
                      return FadeIn(
                        duration: const Duration(milliseconds: 500),
                        child: Padding(
                          padding: EdgeInsets.only(top: (index == 0 ? 0 : 20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data[index].data.category?.name ?? "",
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            "بیشتر",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: CustomColors.yellow500),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: CustomColors.yellow500,
                                            size: 15,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CarouselSlider(
                                items: [
                                  ...results.map((e) {

                                    return Product(result: e);
                                  })
                                ],
                                options: CarouselOptions(
                                  height: 230,
                                  viewportFraction: 0.4,
                                  enableInfiniteScroll: false,
                                  enlargeCenterPage: false,
                                  autoPlay: false,
                                  padEnds: false,
                                  pageSnapping: false,
                                  scrollPhysics: const BouncingScrollPhysics(),
                                  onPageChanged: (index, carousel) {},
                                  scrollDirection: Axis.horizontal,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
