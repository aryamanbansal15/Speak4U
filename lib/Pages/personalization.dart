import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '../main.dart';
import '../utils/invert.dart';
import '../utils/routes.dart';
import '../utils/translate.dart';

class PersonalizationPage extends StatefulWidget {
  const PersonalizationPage({super.key, required this.langCode});
  final String langCode;

  @override
  State<PersonalizationPage> createState() => _PersonalizationPageState();
}

class _PersonalizationPageState extends State<PersonalizationPage> {
  String theme = "Light";
  final List<String> themes = ['Light', 'Dark', 'Citrus Sunrise', 'Neon'];

  String language = "English";
  final List<String> languages = ["English", "Hindi", "French", "Japanese"];

  var vol = 1.0;
  var rate = 0.5;
  final List<dynamic> volArate = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0];

  var pitch = 0.5;
  final List<dynamic> pitchVal = [0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0];

  String main = "Personalization";

  String themeList = "Choose a theme";

  String langList = "Choose a language";

  String pitchList = "Choose a pitch";

  String volList = "Choose volume";

  String rateList = "Choose speed of speaking";

  String selected = "Selected";

  String save = "Save";

  String reset = "Reset";

  @override


  void initState() {
    super.initState();
    _loadPreferences();
    translate(main, widget.langCode, (r)=> main = r);
    translate(themeList, widget.langCode, (r)=> themeList = r);
    translate(langList, widget.langCode, (r)=> langList = r);
    translate(save, widget.langCode, (r)=> save = r);
    translate(pitchList, widget.langCode, (r)=> pitchList = r);
    translate(volList, widget.langCode, (r)=> volList = r);
    translate(rateList, widget.langCode, (r)=> rateList = r);
    translate(selected, widget.langCode, (r)=> selected = r);
    translate(reset, widget.langCode, (r)=>reset = r);

  }

  void translate (text, langCode, void Function(String) assign) async{
    String result = await Translate().translate(text, langCode);
    setState(() {
      assign(result);
    });
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      theme = prefs.getString("theme") ?? "Light";
      language = languageName(prefs.getString("langCode") ?? "en");
      pitch = prefs.getDouble("pitch") ?? 0.5;
      vol = prefs.getDouble("vol") ?? 1.0;
      rate = prefs.getDouble("rate") ?? 1.0;
    });
  }

  Future<void> _savePreferences(String theme, String langCode, String langCodeSp, dynamic vol, dynamic rate, dynamic pitch) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("theme", theme);
    await prefs.setString("langCode", langCode);
    await prefs.setString("langCodeSp", languageCodeSp(langCode));
    await prefs.setDouble("pitch", pitch);
    await prefs.setDouble("vol", vol);
    await prefs.setDouble("rate", rate);
  }

  Widget build(BuildContext context) {
    final textColor = invertColor(Theme.of(context).cardColor);
    return Scaffold(
      appBar: AppBar(title: Text(main)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    themeList,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      DropdownButton<String>(
                        value: theme,
                        onChanged: (String? newValue) {
                          setState(() {
                            theme = newValue!;
                          });
                        },
                        items: themes.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(
                              color: textColor,
                            ),),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      "$selected: $theme".text.color(textColor).make()
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 1,
                width: 2000,
                color: textColor,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    langList,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      DropdownButton<String>(
                        value: language,
                        onChanged: (String? newValue) {
                          setState(() {
                            language = newValue!;
                          });
                        },
                        items: languages.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(
                              color: textColor,
                            ),),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      "$selected: $language".text.color(textColor).make()
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 1,
                width: 2000,
                color: textColor,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pitchList,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      DropdownButton<dynamic>(
                        value: pitch,
                        onChanged: (dynamic newValue) {
                          setState(() {
                            pitch = newValue!;
                          });
                        },
                        items: pitchVal.map((dynamic value) {
                          return DropdownMenuItem<dynamic>(
                            value: value,
                            child: Text(value.toString(), style: TextStyle(
                              color: textColor,
                            ),),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      "$selected: $pitch".text.color(textColor).make(),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 1,
                width: 2000,
                color: textColor,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    volList,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      DropdownButton<dynamic>(
                        value: vol,
                        onChanged: (dynamic newValue) {
                          setState(() {
                            vol = newValue!;
                          });
                        },
                        items: volArate.map((dynamic value) {
                          return DropdownMenuItem<dynamic>(
                            value: value,
                            child: Text(value.toString(), style: TextStyle(
                              color: textColor,
                            ),),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      "$selected: $vol".text.color(textColor).make()
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 1,
                width: 2000,
                color: textColor,
              ),
              const SizedBox(height: 10),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                   rateList,
                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                 ),
                 const SizedBox(height: 10),
                 Column(
                   children: [
                     DropdownButton<dynamic>(
                       value: rate,
                       onChanged: (dynamic newValue) {
                         setState(() {
                           rate = newValue!;
                         });
                       },
                       items: volArate.map((dynamic value) {
                         return DropdownMenuItem<dynamic>(
                           value: value,
                           child: Text(value.toString(), style: TextStyle(
                             color: textColor,
                           ),),
                         );
                       }).toList(),
                     ),
                     const SizedBox(height: 20),
                     "$selected: $rate".text.color(textColor).make()
                   ],
                 ),
               ],
             ),
              const SizedBox(height: 10),
              Container(
                height: 1,
                width: 2000,
                color: textColor,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async{
                  final langCode = languageCode(language);
                  final langCodeSp = languageCodeSp(language);
                  await _savePreferences(theme, langCode, langCodeSp, vol, rate, pitch);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(appTheme: theme, langCode: langCode, langCodeSp: langCodeSp, pitch: pitch, rate: rate, vol: vol),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(64), // Rounded corners
                  ),
                  minimumSize: Size(200, 80),
                ),
                child: save.text.xl4.make(),
              ),
            const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _savePreferences("Light", "en", "en-US", 1.0, 1.0, 0.5);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(appTheme: 'Light', langCode: 'en', langCodeSp: 'en-US', pitch: 0.5, rate: 1.0, vol: 1.0),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(64), // Rounded corners
                  ),
                  minimumSize: Size(200, 80),
                ),
                child: reset.text.xl4.make(),
              ),
            ],
          ).p16(),
        ),
      ),
        bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil(MyRoutes.homeRoute, (Route<dynamic> route)=> false);
              },style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32), // Rounded corners
              ),
              minimumSize: Size(150, 60),
            ),
                child: Icon(Icons.home, size:40)),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil(MyRoutes.customRoute, (Route<dynamic> route)=> false);
            },style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32), // Rounded corners
              ),
              minimumSize: Size(150, 60),
            ),
                child: Icon(Icons.notes, size:40))
          ],
        )
    );
  }

  String languageCode(String language) {
    switch (language) {
      case "English":
        return "en";
      case "Hindi":
        return "hi";
      case "French":
        return "fr";
      case "Japanese":
        return "ja";
      default:
        return "en";
    }
  }

  String languageCodeSp(String language) {
    switch (language) {
      case "English":
        return "en-US";
      case "Hindi":
        return "hi-IN";
      case "French":
        return "fr-FR";
      case "Japanese":
        return "ja-JP";
      default:
        return "en-UK";
    }
  }

  String languageName(String s) {
    switch(s) {
      case "en":
        return "English";
      case "hi":
        return "Hindi";
      case "fr":
        return "French";
      case "ja":
        return "Japanese";
      default:
        return "English";
    }
  }
}
