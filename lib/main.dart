import 'package:flutter/material.dart';
import 'package:speak4u/Pages/home_page.dart';
import 'package:speak4u/utils/routes.dart';
import 'package:speak4u/utils/themes.dart';

import 'Pages/custom.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      themeMode: ThemeMode.system,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(), // Run By Default
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.customRoute: (context) => CustomPage(),
      },
    );
  }
}
