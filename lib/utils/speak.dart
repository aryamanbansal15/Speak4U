import 'package:flutter_tts/flutter_tts.dart';

class Speak {
  static final FlutterTts _tts = FlutterTts();

  static Future<void> speak(String text, String langCode, dynamic rate, dynamic pitch, dynamic vol) async {
      await _tts.setVolume(vol);
      await _tts.setLanguage(langCode);
      await _tts.setPitch(pitch);
      await _tts.setSpeechRate(rate);
      await _tts.speak(text);

  }

  static Future<void> stop() async {

      await _tts.stop();

  }
}
