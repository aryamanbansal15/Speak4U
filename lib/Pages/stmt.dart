import 'package:flutter/material.dart';
import 'package:speak4u/Models/commands.dart';
import 'package:speak4u/Widgets/Home%20Widgets/stmt_header.dart';
import 'package:speak4u/Widgets/Home%20Widgets/stmt_list.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Widgets/Home Widgets/command_list.dart';
import '../utils/speak.dart';

class StmtPage extends StatelessWidget {
  const StmtPage({super.key, required this.command});
  final Command command;

  @override
  Widget build(BuildContext context) {
    // itemBuilder: (BuildContext context, int index) {
    //   final command = CommandModel.commands[index];
    // };
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: Vx.m20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StmtHeader(),
                    if(command.phrases.isNotEmpty)
                      Expanded(
                        child: StmtList(phrases: command.phrases).py16(),
                      )
                    else
                      Center(child: CircularProgressIndicator()),
                    ElevatedButton(
                      onPressed: () {
                        Speak.stop();
                      },
                      child: "STOP".text.xl2.make(),
                    ).w(200).h(60).centered(),
                  ],
                )
            )
        )
    );
  }
}
