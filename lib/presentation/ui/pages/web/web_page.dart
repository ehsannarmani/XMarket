import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xmarket/presentation/utils/custom_colors.dart';

class WebPage extends StatefulWidget {
  WebPage({Key? key,required this.url}) : super(key: key);
  String url;

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {

  bool loaded = false;
  bool failed = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          !loaded ? Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: Colors.white,),
                SizedBox(height: 20,),
                Text("کمی صبرکنید...")
              ],
            ),
          ) : SizedBox(),
          !failed ? WebView(
            initialUrl: widget.url,
            backgroundColor: Colors.transparent,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (_){
              setState(() {
                loaded = false;
                failed = false;
              });
            },
            onPageFinished: (_){
              setState(() {
                loaded = true;
              });
            },
            allowsInlineMediaPlayback: true,
            onWebResourceError: (_){
              setState(() {
                failed = true;
              });
            },
            onWebViewCreated: (_){
              print("web view created");
            },

          ): SizedBox(),

          failed ? Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outlined,color: CustomColors.red500,),
                SizedBox(height: 20,),
                Text("مشکلی در بارگذاری صفحه بوجود آمد!",style: TextStyle(color: CustomColors.red500),)
              ],
            ),
          ) : SizedBox(),

        ],
      ),
    );
  }
}
