import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speak4u/utils/invert.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/routes.dart';
import '../utils/speak.dart';
import '../utils/translate.dart';

class CustomPage extends StatefulWidget {
  const CustomPage({super.key, required this.langCode, required this.langCodeSp, required this.vol, required this.rate, required this.pitch});
  final String langCode;
  final String langCodeSp;
  final vol;
  final rate;
  final pitch;

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {

  String command = "";
  String customCommands = "CUSTOM COMMANDS";
  String hintText = "Enter what you want to speak";
  String labelText = "Command";
  String speak = "SPEAK";
  String stop = "STOP";
  String backToHome = "BACK TO HOME";



  @override

  void initState() {
    super.initState();
    translate(customCommands, widget.langCode, (r)=> customCommands = r);
    translate(hintText, widget.langCode, (r)=> hintText = r);
    translate(labelText, widget.langCode, (r)=> labelText = r);
    translate(speak, widget.langCode, (r)=> speak = r);
    translate(stop, widget.langCode, (r)=> stop = r);
    translate(backToHome, widget.langCode, (r)=> backToHome = r);

  }

  void translate(String text, String langCode, void Function(String) assign) async {
    String result = await Translate().translate(text, langCode);
    setState(() {
      assign(result);
    });
  }

  Widget build(BuildContext context) {
    final textColor = invertColor(Theme.of(context).cardColor);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            customCommands.text.bold.center.xl5.color(textColor).fontFamily(GoogleFonts.luckiestGuy().fontFamily!).make().py32(),
            Container(
              color: Theme.of(context).cardColor,
              width: MediaQuery.of(context).size.width*3 / 4,
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      style : TextStyle(color: textColor),
                      decoration: InputDecoration(
                        hintText: hintText, hintStyle: TextStyle(color: textColor),
                        labelText: labelText, labelStyle: TextStyle(color: textColor),
                      ),
                      onChanged: (value) {
                        command = value;
                        translate(command, widget.langCode, (r)=>command = r);
                        setState(() {});
                      },
                    ),
                    SizedBox.fromSize(size: Size(200, 20),),
                    ElevatedButton(
                      onPressed: () {
                        Speak.speak(command, widget.langCodeSp, widget.rate, widget.pitch, widget.vol);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32), // Rounded corners
                        ),
                      ),
                      child: "$speak 🔊".text.xl2.make(),
                    ).w(200).h(60).centered(),
                    SizedBox.fromSize(size: Size(200, 50),),
                    ElevatedButton(
                      onPressed: () {
                        Speak.stop();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32), // Rounded corners
                        ),
                      ),
                      child: "$stop 🛑".text.xl2.make(),
                    ).w(200).h(60).centered().py(10),
                  ],
                ),
              )
            ).centered(),
          ],
        ),
      ),
        bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil(MyRoutes.homeRoute, (Route<dynamic> route)=> false);
              },
        style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32), // Rounded corners
    ),
    minimumSize: Size(150, 60),
    ),
    child: Icon(Icons.home, size: 40,)),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil(MyRoutes.personRoute, (Route<dynamic> route)=> false);
            },
    style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(32), // Rounded corners
    ),
    minimumSize: Size(150, 60),
    ),
    child: Icon(Icons.settings, size: 40,))
          ],
        )
    );
  }
}
