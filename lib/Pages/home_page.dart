import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:speak4u/Models/commands.dart';
import 'package:speak4u/Models/messages.dart';
import 'package:speak4u/Widgets/Home%20Widgets/command_header.dart';
import 'package:speak4u/Widgets/Home%20Widgets/command_list.dart';
import 'package:speak4u/utils/routes.dart';
import 'package:speak4u/utils/translate.dart';
import 'package:velocity_x/velocity_x.dart';

import '../providers/settings_provider.dart';
import '../utils/invert.dart';

class HomePage extends StatefulWidget {
  final String langCode;
  final String langCodeSp;
  final rate;
  final vol;
  final pitch;
  final fileName;

  const HomePage({super.key, required this.langCode, required this.langCodeSp, required this.rate, required this.vol, required this.pitch, required this.fileName});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // String text = "CUSTOM COMMANDS";
  @override


  void initState() {
    super.initState();
    loadData();
    // translate(text, widget.langCode);
  }

  // void translate(String text, String langCode) async {
  //   String result = await Translate().translate(text, langCode);
  //   setState(() {
  //     text = result;
  //   });
  // }


  void loadData() async {
    await Future.delayed(const Duration(seconds: 3));

    try {
      print("Loading file: ${widget.fileName}");
      final speakJson = await rootBundle.loadString("${widget.fileName}");
      final decodedData = jsonDecode(speakJson);
      var productData = decodedData["commands"];

      print("Decoded command count: ${productData.length}");

      CommandModel.commands = List.from(productData)
          .map<Command>((item) => Command.fromMap(item))
          .toList();

      var messagesData = decodedData["messages"][0];
      MessageModel.messages = [Message.fromMap(messagesData)];


      setState(() {});
    } catch (e) {
      print("Error loading JSON: $e");
    }
  }


  Widget build(BuildContext context) {
    final textColor = invertColor(Theme.of(context).cardColor);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.cardColor,
        title: Text("SPEAK4U", style: GoogleFonts.oswald(
          textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
            color: textColor,
        ),)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommandHeader(langCode: widget.langCode, messages: MessageModel.messages).py16(),
              if(CommandModel.commands.isNotEmpty)
                Expanded(
                  child: CommandList(langCode: widget.langCode, langCodeSp: widget.langCodeSp, rate: widget.rate, pitch: widget.pitch, vol: widget.vol).py16(),
                )
              else
                Center(child: CircularProgressIndicator()),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, MyRoutes.customRoute);
              //   },
              //   style: ElevatedButton.styleFrom(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(32), // Rounded corners
              //     ),
              //   ),
              //   child: text.text.xl2.color(textColor).make(),
              // ).w(300).h(60).centered()
            ],
          )
        )
      ),
        bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil(MyRoutes.personRoute, (Route<dynamic> route)=> false);
            },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32), // Rounded corners
                  ),
                  minimumSize: Size(150, 60),
                ),
                child: Icon(Icons.settings, size: 40,)),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil(MyRoutes.customRoute, (Route<dynamic> route)=> false);
            },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32), // Rounded corners
                  ),
                  minimumSize: Size(150, 60),
                ),
                child: Icon(Icons.notes, size:40),
            )
          ],
        )
    );
  }
}
