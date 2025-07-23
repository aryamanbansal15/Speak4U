import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speak4u/Pages/home_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Models/messages.dart';
import '../Widgets/restart.dart';
import '../main.dart';
import '../providers/settings_provider.dart';
import '../utils/invert.dart';
import '../utils/routes.dart';
import '../utils/translate.dart';

class PersonalizationPage extends StatefulWidget {
  PersonalizationPage({super.key, required this.langCode});
  final String langCode;
  final List<Message> messages = MessageModel.messages;

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

  String fileName = "commands_eng.json";
  

  @override


  @override
  void initState() {
    super.initState();

    // Load initial values from provider
    Future.delayed(Duration.zero, () {
      final settings = Provider.of<SettingsProvider>(context, listen: false);
      setState(() {
        theme = settings.theme;
        language = languageName(settings.langCode);
        pitch = settings.pitch;
        vol = settings.vol;
        rate = settings.rate;
        fileName = settings.fileName;
      });
    });
  }


  Future<void> _savePreferences(String theme, String langCode, String langCodeSp, dynamic vol, dynamic rate, dynamic pitch, String fileName) async {
    final provider = Provider.of<SettingsProvider>(context, listen: false);
    await provider.update(
      theme: theme,
      langCode: langCode,
      langCodeSp: langCodeSp,
      pitch: pitch,
      vol: vol,
      rate: rate,
      fileName: fileName,
    );
    Restart.restartApp(context);
    // Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => HomePage(
    //       langCode: langCode,
    //       langCodeSp: langCodeSp,
    //       rate: rate,
    //       vol: vol,
    //       pitch: pitch,
    //       fileName: fileName,
    //     ),
    //   ),
    //       (route) => false,
    // );

  }


  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();
    final message = widget.messages[0];
    final textColor = invertColor(Theme.of(context).cardColor);
    return Scaffold(
        appBar: AppBar(title: Text(message.personalization)),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      message.theme,
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
                        "${message.selected}: $theme".text.color(textColor).make()
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
                      message.language,
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
                        "${message.selected}: $language".text.color(textColor).make()
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
                      message.pitch,
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
                        "${message.selected}: $pitch".text.color(textColor).make(),
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
                      message.volume,
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
                        "${message.selected}: $vol".text.color(textColor).make()
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
                      message.speed,
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
                        "${message.selected}: $rate".text.color(textColor).make()
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
                    final fileName = fileNameA(language);
                    await _savePreferences(theme, langCode, langCodeSp, vol, rate, pitch, fileName);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(64), // Rounded corners
                    ),
                    minimumSize: Size(200, 80),
                  ),
                  child: message.save.text.xl4.make(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _savePreferences("Light", "en", "en-US", 1.0, 0.3, 0.8, "commands_eng.json");
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(64), // Rounded corners
                    ),
                    minimumSize: Size(200, 80),
                  ),
                  child: message.reset.text.xl4.make(),
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

  String fileNameA(String s)
  {
    switch(s){
      case "English":
        return "assets/files/commands_eng.json";
      case "Hindi":
        return "assets/files/commands_hindi.json";
      case "French":
        return "assets/files/commands_french.json";
      case "Japanese":
        return "assets/files/commands_jap.json";
      default:
        return "assets/files/commands_eng.json";
    }
  }
}