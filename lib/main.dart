import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speak4u/Pages/home_page.dart';
import 'package:speak4u/Pages/personalization.dart';
import 'package:speak4u/utils/routes.dart';
import 'package:speak4u/utils/themes.dart';

import 'Pages/custom.dart';

class MyApp extends StatefulWidget {
  final String appTheme;
  final String langCode;
  final String langCodeSp;
  final pitch;
  final vol;
  final rate;

  const MyApp({super.key, required this.appTheme, required this.langCode, required this.langCodeSp, required this.pitch, required this.vol, required this.rate});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeData theme;


  @override
  void initState() {
    super.initState();
    theme = _getThemeMode(widget.appTheme);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(langCode: widget.langCode, langCodeSp: widget.langCodeSp, rate: widget.rate, pitch: widget.pitch, vol: widget.vol),
        MyRoutes.homeRoute: (context) => HomePage(langCode: widget.langCode, langCodeSp: widget.langCodeSp, rate: widget.rate, pitch: widget.pitch, vol: widget.vol),
        MyRoutes.customRoute: (context) => CustomPage(langCode: widget.langCode, langCodeSp: widget.langCodeSp, rate: widget.rate, pitch: widget.pitch, vol: widget.vol),
        MyRoutes.personRoute: (context) => PersonalizationPage(langCode: widget.langCode),
      },
    );
  }

  ThemeData _getThemeMode(String appTheme) {
    switch (appTheme) {
      case "Light":
        return MyTheme.lightTheme(context);
      case "Dark":
        return MyTheme.darkTheme(context);
      case "Citrus Sunrise":
        return MyTheme.citrusSunrise(context);
      case "Neon":
        return MyTheme.neonTheme(context);
      default:
        return MyTheme.lightTheme(context); // fallback
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final theme = prefs.getString("theme") ?? "Light";
  final lang = prefs.getString("langCode") ?? "en";
  final langSp = prefs.getString("langCodeSp") ?? "en-US";
  final pitch = prefs.getDouble("pitch") ?? 1;
  final rate = prefs.getDouble("rate") ?? 0.5;
  final vol = prefs.getDouble("vol") ?? 1;
  runApp(MyApp(appTheme: theme, langCode: lang, langCodeSp: langSp, vol: vol, rate: rate, pitch: pitch));
}
