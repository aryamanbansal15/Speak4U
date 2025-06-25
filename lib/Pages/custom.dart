import 'package:flutter/material.dart';
import 'package:speak4u/utils/invert.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/speak.dart';

class CustomPage extends StatefulWidget {
  const CustomPage({super.key});

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {

  String command = "";

  @override
  Widget build(BuildContext context) {
    final textColor = invertColor(Theme.of(context).cardColor);
    return Scaffold(
      backgroundColor: context.cardColor,
      body: SafeArea(
        child: Column(
          children: [
            Material(
              color: context.canvasColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 800,
                      height: 200,
                      color: context.cardColor,
                    ),
                    Container(
                      width: 800,
                      color: context.cardColor,
                      child: "Text to be Spoken".text.xl.bold.color(textColor).make(),
                    ),
                    TextFormField(
                    style : TextStyle(color: textColor),
                    decoration: InputDecoration(
                      hintText: "Enter what you want to speak", hintStyle: TextStyle(color: textColor),
                      labelText: "Command", labelStyle: TextStyle(color: textColor),
                    ),
                    onChanged: (value) {
                      command = value;
                      setState(() {});
                    },
                  ),
                ],
                ),
              ),
            ),
            SizedBox.fromSize(size: Size(200, 60),),
            ElevatedButton(
              onPressed: () {
                Speak.speak(command);
              },
              child: "SPEAK".text.xl2.make(),
            ).w(200).h(60).centered(),
            SizedBox.fromSize(size: Size(200, 100),),
            ElevatedButton(
              onPressed: () {
                Speak.stop();
              },
              child: "STOP".text.xl2.make(),
            ).w(200).h(60).centered(),

          ],
        ),
      ),
    );
  }
}
