import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmarket/app.dart';
import 'package:xmarket/logic/bloc/home/home_bloc.dart';

import 'di.dart';
import 'logic/bloc/main/main_bloc.dart';
import 'logic/bloc/product/product_bloc.dart';
import 'logic/bloc/search/search_bloc.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  setup();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>locator<MainBloc>()),
        BlocProvider(create: (_)=>locator<HomeBloc>()),
        BlocProvider(create: (_)=>locator<ProductBloc>()),
        BlocProvider(create: (_)=>locator<SearchBloc>()),
      ],
      child: const MyApp(),
    )
  );
}


