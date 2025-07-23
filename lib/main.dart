import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speak4u/Pages/home_page.dart';
import 'package:speak4u/Pages/personalization.dart';
import 'package:speak4u/Widgets/restart.dart';
import 'package:speak4u/providers/settings_provider.dart';
import 'package:speak4u/utils/routes.dart';
import 'package:speak4u/utils/themes.dart';

import 'Models/messages.dart';
import 'Pages/custom.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();

    final theme = _getThemeMode(context, settings.theme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(
            langCode: settings.langCode,
            langCodeSp: settings.langCodeSp,
            rate: settings.rate,
            pitch: settings.pitch,
            vol: settings.vol,
            fileName: settings.fileName
        ),
        MyRoutes.homeRoute: (context) => HomePage(
            langCode: settings.langCode,
            langCodeSp: settings.langCodeSp,
            rate: settings.rate,
            pitch: settings.pitch,
            vol: settings.vol,
            fileName: settings.fileName
        ),
        MyRoutes.customRoute: (context) => CustomPage(
            langCode: settings.langCode,
            langCodeSp: settings.langCodeSp,
            rate: settings.rate,
            pitch: settings.pitch,
            vol: settings.vol,
        messages: MessageModel.messages
        ),
        MyRoutes.personRoute: (context) => PersonalizationPage(langCode: settings.langCode),
      },
    );
  }

  ThemeData _getThemeMode(BuildContext context, String appTheme) {
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
        return MyTheme.lightTheme(context);
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final theme = prefs.getString("theme") ?? "Light";
  final lang = prefs.getString("langCode") ?? "en";
  final langSp = prefs.getString("langCodeSp") ?? "en-US";
  final pitch = prefs.getDouble("pitch") ?? 0.7;
  final rate = prefs.getDouble("rate") ?? 0.3;
  final vol = prefs.getDouble("vol") ?? 1;
  final fileName = prefs.getString("fileName") ?? "assets/files/commands_eng.json";

  runApp(
    ChangeNotifierProvider(
      create: (_) => SettingsProvider().load(
        theme: theme,
        langCode: lang,
        langCodeSp: langSp,
        pitch: pitch,
        rate: rate,
        vol: vol,
        fileName: fileName,
      ),
      child: const Restart(child: MyApp()),
    ),
  );
}
