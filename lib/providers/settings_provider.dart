import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  String _theme = 'Light';
  String _langCode = 'en';
  String _langCodeSp = 'en-US';
  double _pitch = 0.7;
  double _rate = 0.3;
  double _vol = 1.0;
  String _fileName = "assets/files/commands_eng.json";

  String get theme => _theme;
  String get langCode => _langCode;
  String get langCodeSp => _langCodeSp;
  double get pitch => _pitch;
  double get rate => _rate;
  double get vol => _vol;
  String get fileName => _fileName;

  SettingsProvider load({
    required String theme,
    required String langCode,
    required String langCodeSp,
    required double pitch,
    required double vol,
    required double rate,
    required String fileName,
  }) {
    _theme = theme;
    _langCode = langCode;
    _langCodeSp = langCodeSp;
    _pitch = pitch;
    _vol = vol;
    _rate = rate;
    _fileName = fileName;
    return this;
  }

  Future<void> update({
    required String theme,
    required String langCode,
    required String langCodeSp,
    required double pitch,
    required double vol,
    required double rate,
    required String fileName,
  }) async {
    _theme = theme;
    _langCode = langCode;
    _langCodeSp = langCodeSp;
    _pitch = pitch;
    _vol = vol;
    _rate = rate;
    _fileName = fileName;

    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("theme", theme);
    await prefs.setString("langCode", langCode);
    await prefs.setString("langCodeSp", langCodeSp);
    await prefs.setDouble("pitch", pitch);
    await prefs.setDouble("vol", vol);
    await prefs.setDouble("rate", rate);
    await prefs.setString("fileName", fileName);
  }
}
