
import 'package:flutter/material.dart';
import 'package:xmarket/presentation/utils/navigator.dart';
import 'package:xmarket/presentation/utils/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'presentation/ui/pages/main/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigatorHelper.key,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa","IR")
      ],
      locale: const Locale("fa","IR"),
      darkTheme: MyThemes.darkTheme,
      theme: MyThemes.lightTheme,
      themeMode: ThemeMode.dark,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: MainPage(),
      ),
    );
  }
}