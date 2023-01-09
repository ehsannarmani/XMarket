
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xmarket/data/data_source/base_model.dart';
import 'package:xmarket/logic/bloc/product/product_bloc.dart';
import 'package:xmarket/presentation/ui/pages/web/web_page.dart';
import 'package:xmarket/presentation/utils/navigator.dart';

import '../../utils/custom_colors.dart';

class ProductPage extends StatefulWidget {
  String productId;

  ProductPage({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();

    ProductBloc productBloc = BlocProvider.of(context);

    productBloc.add(GetProductInfo(widget.productId));
  }
  @override
  void dispose() {
    super.dispose();
    ProductBloc productBloc = BlocProvider.of(context);

    productBloc.add(ClearEvent());
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocBuilder<ProductBloc, ProductState>(
      buildWhen: (preState,newState){
        return preState.productInfo != newState.productInfo;
      },
      builder: (context, state) {
        if (state.productInfo.status == ResponseStatus.Loading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.productInfo.status == ResponseStatus.Success) {
          var data = state.productInfo.data;
          return Scaffold(
            appBar: AppBar(
              title: Text('${data.name1!.split("|").first}',
                  style: TextStyle(color: Colors.white),
                  textDirection: TextDirection.rtl),
              titleSpacing: 0,
              actions: [
                IconButton(
                  iconSize: 20,
                  onPressed: (){
                    var link = "https://xmarket.app/${widget.productId}";
                    FlutterShare.share(title: "کالا",text: "کالای ${data.name2} را در ایکس مارکت مشاهده کنید و از ارزان ترین فروشگاه خریداری کنید:\n$link");
                  },
                  icon: Icon(Icons.share,color: Colors.white,),
                )
              ],
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: CachedNetworkImage(
                        imageUrl: data.imageUrl!,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(data.name1!,),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data.buyBoxPriceText!,
                          style:
                              TextStyle(color: CustomColors.green500, fontSize: 13),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              NavigatorHelper.key?.currentState?.push(
                                  PageTransition(
                                      child: WebPage(url: data.buyBoxButtonLink!),
                                      type: PageTransitionType.bottomToTop
                                  )
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: CustomColors.red500),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 7),
                              child: Text(data.buyBoxButtonText!),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        data.structuralSpecs?.headers != null ?
                        BlocBuilder<ProductBloc,ProductState>(
                          buildWhen: (preState,newState){
                            return preState.specsVisibility != newState.specsVisibility;
                          },
                          builder: (context,state){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...data.structuralSpecs!.headers!.map((e){
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(e.header!,style: TextStyle(fontWeight: FontWeight.bold),),
                                          InkWell(
                                            onTap: (){
                                              BlocProvider.of<ProductBloc>(context).add(ChangeSpecsVisibility());
                                            },
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text(state.specsVisibility ? "مخفی" : "نمایش",style: TextStyle(fontSize: 12,color: CustomColors.yellow500),),
                                                SizedBox(width: 5,),
                                                Icon(state.specsVisibility ? Icons.visibility_off : Icons.visibility,size: 16,color: CustomColors.yellow500,)
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      AnimatedCrossFade(
                                          firstChild: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ...e.specs!.keys.map((key){
                                                return Column(
                                                  children: [
                                                    Wrap(
                                                      alignment: WrapAlignment.start,
                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                      children: [
                                                        Text(key+":",style: TextStyle(color: CustomColors.red500,fontSize: 13),),
                                                        SizedBox(width: 5,),
                                                        Text(e.specs![key],style: TextStyle(fontSize: 13),),
                                                      ],
                                                    ),
                                                    SizedBox(height: 5,)
                                                  ],
                                                );
                                                return Text(key+": ${e.specs![key]}",style: TextStyle(fontSize: 13),);
                                              })
                                            ],
                                          ),
                                          secondChild: SizedBox(),
                                          crossFadeState: state.specsVisibility ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                                          duration: Duration(milliseconds: 500)
                                      )

                                    ],
                                  );
                                })
                              ],
                            );
                          },
                        ) : SizedBox(),
                        const SizedBox(height: 10,),

                        Visibility(
                          visible: data.productsInfo?.count != null && data.productsInfo!.count! > 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("فروشنده ها:",style: TextStyle(fontWeight: FontWeight.bold),),
                              const SizedBox(height: 10,),
                              ...data.productsInfo!.result!.map((e){
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: theme.primaryColor
                                      ),
                                      child: Container(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(e.name1!,style: TextStyle(fontSize: 13),),
                                              SizedBox(height: 5,),
                                              Text("نام فروشگاه: ${e.shopName}",style: TextStyle(fontSize: 13,color: CustomColors.red500),),
                                              SizedBox(height: 3,),
                                              Text("قیمت: ${e.priceText}",style: TextStyle(fontSize: 12,color: CustomColors.green500),),
                                              SizedBox(height: 7,),
                                              SizedBox(
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    NavigatorHelper.key?.currentState?.push(
                                                      PageTransition(
                                                        child: WebPage(url: e.pageUrl!),
                                                        type: PageTransitionType.bottomToTop
                                                      )
                                                    );
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      primary: CustomColors.green500),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(vertical: 7),
                                                    child: Text("خرید از این فروشگاه",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 13),),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,)
                                  ],
                                );
                              })
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Text("عملیات با خطا مواجه شد..."),
            ),
          );
        }
      },
    );
  }
  Future<String?> getUrlLocation(String url) async {
    final client = HttpClient();
    var uri = Uri.parse(url);
    var request = await client.getUrl(uri);
    request.followRedirects = false;
    var response = await request.close();
    return response.headers.value(HttpHeaders.locationHeader);
  }
}
