import 'package:flutter/material.dart';
import 'package:speak4u/Models/commands.dart';
import 'package:speak4u/Models/messages.dart';
import 'package:speak4u/Widgets/Home%20Widgets/stmt_header.dart';
import 'package:speak4u/Widgets/Home%20Widgets/stmt_list.dart';
import 'package:speak4u/utils/invert.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Widgets/Home Widgets/command_list.dart';
import '../utils/routes.dart';
import '../utils/speak.dart';
import '../utils/translate.dart';

class StmtPage extends StatefulWidget {
  const StmtPage({super.key, required this.command, required this.langCode, required this.langCodeSp, required this.vol, required this.rate, required this.pitch, required this.messages});
  final Command command;
  final String langCode;
  final String langCodeSp;
  final vol;
  final rate;
  final pitch;
  final List<Message> messages;

  @override

  State<StmtPage> createState() => _StmtPageState();

}

class _StmtPageState extends State<StmtPage> {

  // String stop = "STOP";
  // String backToHome = "BACK TO HOME";

  @override

  void initState() {
    super.initState();
    // translate(stop, widget.langCode);
    // translate(backToHome, widget.langCode);
  }

  // void translate(String text, String langCode) async {
  //   String result = await Translate().translate(text, langCode);
  //   setState(() {
  //     text = result;
  //   });
  // }

  Widget build(BuildContext context) {
    final message = widget.messages[0];
    return Scaffold(
      backgroundColor: Theme.of(context).disabledColor,
        body: SafeArea(
            child: Container(
                padding: Vx.m20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StmtHeader(langCode: widget.langCode, messages: MessageModel.messages).py16(),
                    if(widget.command.phrases.isNotEmpty)
                      Expanded(
    child: StmtList(phrases: widget.command.phrases, langCode: widget.langCode, langCodeSp: widget.langCodeSp, rate: widget.rate, pitch: widget.pitch, vol: widget.vol).py16(),
                      )
                    else
                      Center(child: CircularProgressIndicator()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Speak.stop();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32), // Rounded corners
                            ),
                          ),
                          child: "${message.stop}".text.xl2.make(),
                        ).w(200).h(60).centered(),
                      ],
                    )
                  ],
                )
            )
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
      child: Icon(Icons.home, size:40),
            ),
            ElevatedButton(onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil(MyRoutes.customRoute, (Route<dynamic> route)=> false);
            },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32), // Rounded corners
                  ),
                  minimumSize: Size(150, 60),
                ),
                child: Icon(Icons.notes, size:40)),
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
          ],
        )
    );
  }
}
