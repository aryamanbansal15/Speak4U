import 'package:flutter/material.dart';
import 'package:speak4u/Pages/home_page.dart';
import 'package:speak4u/utils/routes.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /* home: HomePage(),*/
      themeMode: ThemeMode.light,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(), // Run By Default
        MyRoutes.homeRoute: (context) => HomePage(),
      },
    );
  }
}
