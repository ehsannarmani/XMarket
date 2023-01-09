import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xmarket/data/models/Products.dart';

import '../../../utils/custom_colors.dart';
import '../../../utils/navigator.dart';
import '../product_page.dart';

class Product extends StatelessWidget {
  Results result;
  Product({Key? key,required this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: (){
        NavigatorHelper.key?.currentState?.push(PageTransition(child: ProductPage(productId: result.randomKey!,), type: PageTransitionType.bottomToTop));
      },

      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(7),
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(15)
              ),
              color: theme.primaryColor
          ),
          width: double.infinity,
          height: 10,
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(7),
                      topLeft: Radius.circular(15),
                    )),
                child: CachedNetworkImage(
                  imageUrl: result.imageUrl!,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 100,
                  placeholder: (context,_){
                    return const Expanded(
                      child: Center(
                        child: Text("ایکس مارکت",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  result.name1!,
                  style: TextStyle(fontSize: 11),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: EdgeInsets.all(7),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(result.priceText!,
                        style: TextStyle(
                            fontSize: 11,
                            color: CustomColors
                                .green500)),
                    Text(
                      result.shopText!,
                      style: TextStyle(
                          fontSize: 10,
                          color:
                          CustomColors.red500),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
