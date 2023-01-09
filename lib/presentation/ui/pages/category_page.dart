import 'package:expandable_tree_menu/expandable_tree_menu.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:xmarket/presentation/ui/pages/search_page.dart';
import 'package:xmarket/presentation/utils/navigator.dart';

class CategoryItem{
  String title;
  int categoryId;
  List<CategoryItem> sub = [];
  bool isSub = false;
  CategoryItem({required this.title,required this.categoryId,this.sub = const [],this.isSub = false});
}

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);



  List<CategoryItem> items = [
    CategoryItem(title: "موبایل و کالای دیجیتال",sub: [
      CategoryItem(title: "گوشی موبایل",isSub: true,categoryId: 94,sub: [
        CategoryItem(title: title, categoryId: categoryId,sub: [
          CategoryItem(title: title, categoryId: categoryId)
        ])
      ]),
      CategoryItem(title: "تبلت",isSub: true,categoryId: 95),
      CategoryItem(title: "هدفون، هدست و هندزفری",isSub: true,categoryId: 97),
      CategoryItem(title: "لوازم جانبی موبایل و تبلت",isSub: true,categoryId: 96),
      CategoryItem(title: "قطعات موبایل و تبلت",isSub: true,categoryId: 1103),
      CategoryItem(title: "لوازم الکتریکی همراه",isSub: true,categoryId: 98),
      CategoryItem(title: "ساعت مچ بند و هوشمند",isSub: true,categoryId: 282),
    ],categoryId: 175),
    CategoryItem(title: "لپ تاپ، کامپیوتر، اداری",sub: [
      CategoryItem(title: "لپ تاپ و نوت بوک",isSub: true,categoryId: 99),
      CategoryItem(title: "کامپیوتر و مانیتور",isSub: true,categoryId: 100),
      CategoryItem(title: "قطعات داخلی لپ تاپ و کامپیوتر",isSub: true,categoryId: 240),
      CategoryItem(title: "لوازم جانبی کامپیوتر و لپ تاپ",isSub: true,categoryId: 101),
      CategoryItem(title: "ماشین های اداری",isSub: true,categoryId: 107),
      CategoryItem(title: "تجهیزات شبکه و ارتباطات",isSub: true,categoryId: 103),
      CategoryItem(title: "تجهیزات ذخیره سازی اطلاعات",isSub: true,categoryId: 102),
      CategoryItem(title: "سیستم های نظارتی و امنیتی و لوازم جانبی",isSub: true,categoryId: 159),
    ],categoryId: 173),
    CategoryItem(title: "هایپر مارکت",sub: [
      CategoryItem(title: "میوه و تره بار",isSub: true,categoryId: 12),
      CategoryItem(title: "مواد غذایی",isSub: true,categoryId: 109),
      CategoryItem(title: "شوینده ها",isSub: true,categoryId: 140),
    ],categoryId: 179),
    CategoryItem(title: "لوازم خانگی",sub: [
      CategoryItem(title: "لوازم آشپزخانه",isSub: true,categoryId: 129),
      CategoryItem(title: "دکوراسیون منزل",isSub: true,categoryId: 131),
      CategoryItem(title: "شستشو و نظافت",isSub: true,categoryId: 134),
      CategoryItem(title: "اتاق خواب",isSub: true,categoryId: 153),
      CategoryItem(title: "تهویه، سرمایش و گرمایش",isSub: true,categoryId: 133),
      CategoryItem(title: "لوازم دوخت و دوز",isSub: true,categoryId: 168),
    ],categoryId: 169),
    CategoryItem(title: "مد و پوشاک",sub: [
      CategoryItem(title: "پوشاک و کفش زنانه",isSub: true,categoryId: 154),
      CategoryItem(title: "پوشاک و کفش مردانه",isSub: true,categoryId: 155),
      CategoryItem(title: "پوشاک و کفش خردسال و نوجوان",isSub: true,categoryId: 143),
      CategoryItem(title: "پوشاک ورزشی مردانه",isSub: true,categoryId: 3322),
      CategoryItem(title: "پوشاک ورزشی زنانه",isSub: true,categoryId: 3321),
      CategoryItem(title: "کیف ورزشی",isSub: true,categoryId: 1979),
      CategoryItem(title: "کیف، کوله، چمدان و ساک",isSub: true,categoryId: 116),
      CategoryItem(title: "جواهر و زیورآلات",isSub: true,categoryId: 127),
      CategoryItem(title: "اکسسوری",isSub: true,categoryId: 2691),
    ],categoryId: 176),
    CategoryItem(title: "زیبایی و بهداشت",sub: [
      CategoryItem(title: "عطر و اسپری",isSub: true,categoryId: 2638),
      CategoryItem(title: "زیبایی و بهداشت مو",isSub: true,categoryId: 160),
      CategoryItem(title: "زیبایی و بهداشت پوست",isSub: true,categoryId: 161),
      CategoryItem(title: "زیبایی و بهداشت ناخن",isSub: true,categoryId: 162),
      CategoryItem(title: "اصلاح و پیرایش",isSub: true,categoryId: 139),
      CategoryItem(title: "بهداشت بانوان",isSub: true,categoryId: 148),
      CategoryItem(title: "بهداشت خانواده",isSub: true,categoryId: 312),
      CategoryItem(title: "بهداشت دهان و دندان",isSub: true,categoryId: 137),
      CategoryItem(title: "تجهیزات آرایشگاهی",isSub: true,categoryId: 1754),
    ],categoryId: 171),
    CategoryItem(title: "صوتی و تصویری",sub: [
      CategoryItem(title: "کنسول بازی و لوازم جانبی",isSub: true,categoryId: 15),
      CategoryItem(title: "تلویزیون و لوازم جانبی",isSub: true,categoryId: 163),
      CategoryItem(title: "گیرنده دیجیتال",isSub: true,categoryId: 164),
      CategoryItem(title: "سیستم های صوتی تصویری",isSub: true,categoryId: 165),
      CategoryItem(title: "دوربین، عکاسی، فیلمبرداری و لوازم جانبی",isSub: true,categoryId: 106),
    ],categoryId: 174),
    CategoryItem(title: "خودرو و وسایل نقلیه",sub: [
      CategoryItem(title: "لوازم یدکی خودرو",isSub: true,categoryId: 293),
      CategoryItem(title: "لوازم جانبی خودرو",isSub: true,categoryId: 126),
      CategoryItem(title: "لوازم مصرفی خودرو",isSub: true,categoryId: 543),
      CategoryItem(title: "موتور سیکلت",isSub: true,categoryId: 19),
      CategoryItem(title: "لوازم مصرفی موتور سیکلت",isSub: true,categoryId: 545),
      CategoryItem(title: "لوازم جانبی موتور سیکلت",isSub: true,categoryId: 3067),
      CategoryItem(title: "لوازم یدکی موتور سیکلت",isSub: true,categoryId: 3068),
    ],categoryId: 458),
    CategoryItem(title: "ورزش و سرگرمی",sub: [
      CategoryItem(title: "ورزشی و تناسب اندام",isSub: true,categoryId: 156),
      CategoryItem(title: "اسباب بازی و سرگرمی",isSub: true,categoryId: 111),
    ],categoryId: 2272),
    CategoryItem(title: "سلامت و پزشکی",sub: [
      CategoryItem(title: "عینک",isSub: true,categoryId: 4443),
      CategoryItem(title: "سنجش سلامت",isSub: true,categoryId: 135),
      CategoryItem(title: "تجهیزات پزشکی",isSub: true,categoryId: 1442),
      CategoryItem(title: "دارو و مکمل ها",isSub: true,categoryId: 152),
      CategoryItem(title: "زناشویی",isSub: true,categoryId: 150),
      CategoryItem(title: "دستگاه های زیبایی",isSub: true,categoryId: 1426),
    ],categoryId: 172),
    CategoryItem(title: "فرهنگی و هنری",sub: [
      CategoryItem(title: "فرهنگی و آموزشی",isSub: true,categoryId: 2249),
      CategoryItem(title: "لوازم عبادت",isSub: true,categoryId: 4355),
      CategoryItem(title: "آلات موسیقی",isSub: true,categoryId: 123),
      CategoryItem(title: "لوازم التحریر",isSub: true,categoryId: 110),
      CategoryItem(title: "آزمایشگاهی",isSub: true,categoryId: 146),
      CategoryItem(title: "مراسم و مناسبت ها",isSub: true,categoryId: 646),
      CategoryItem(title: "صنایع دستی",isSub: true,categoryId: 1703),
    ],categoryId: 170),
    CategoryItem(title: "کودک و نوزاد",sub: [
      CategoryItem(title: "سیسمونی و بهداشت و کودک",isSub: true,categoryId: 112),
      CategoryItem(title: "پوشاک نوزاد و کودک",isSub: true,categoryId: 147),
    ],categoryId: 177),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: ExpandableTree(
            childrenDecoration: BoxDecoration(
                color:theme.primaryColorLight
            ),
            submenuDecoration: BoxDecoration(
                color: theme.primaryColorLight
            ),
            nodes: generateNodes(items),
            onSelect: (value){
              value as CategoryItem;
              NavigatorHelper.key?.currentState?.push(
                PageTransition(
                  child: SearchPage(categoryId: value.categoryId,categoryName: value.title,),
                  type: PageTransitionType.bottomToTop
                )
              );
            },
            nodeBuilder: (context,value){
              value as CategoryItem;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 13),
                child: Container(
                  child: Text(value.title,style: TextStyle(fontSize: value.isSub ? 12 : 14,color: value.isSub ? Colors.grey.shade400 : Colors.grey.shade200),),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
  List<TreeNode> generateNodes(List<CategoryItem> items){
    return items.map((e){
      return TreeNode(
        e,
        subNodes: e.sub.isEmpty ? [] : generateNodes(e.sub)
      );
    }).toList();
  }
}
