import 'package:translator/translator.dart';

class Translate
{
  Future<String> translate(String text, String lang) async {
    final translator = GoogleTranslator();
    try {
      final translation = await translator.translate(text, to: lang);
      return translation.text;
    }
    catch(e) {
      return text;
    }
  }
}