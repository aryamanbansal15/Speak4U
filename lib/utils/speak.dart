import 'package:flutter_tts/flutter_tts.dart';

class Speak {
  static final phrase = FlutterTts();

  static Future<void> speak(String text) async {
    await phrase.setVolume(1.0);
  await phrase.setLanguage("en-UK");
  await phrase.setPitch(1.0);
  await phrase.setSpeechRate(0.5);
  await phrase.speak(text);
  }

  static Future<void> stop() async {
  await phrase.stop();
  }
  }