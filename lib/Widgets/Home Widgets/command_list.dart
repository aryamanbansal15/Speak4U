import 'package:flutter/material.dart';
import 'package:speak4u/Models/commands.dart';
import 'package:speak4u/Pages/stmt.dart';
import 'package:speak4u/utils/invert.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/translate.dart';


class CommandList extends StatefulWidget {
  final String langCode;
  final String langCodeSp;
  final vol;
  final rate;
  final pitch;
  const CommandList({super.key, required this.langCode, required this.langCodeSp, required this.vol, required this.rate, required this.pitch});

  @override
  State<CommandList> createState() => _CommandListState();
}

class _CommandListState extends State<CommandList> {
  Map<int, String> translatedNames = {};

  @override

  void initState() {
    super.initState();
    translate();
  }

  void translate() async {
    for(int i = 0; i<CommandModel.commands.length; i++)
      {
        final name = CommandModel.commands[i].name;
        final translated = await Translate().translate(name, widget.langCode);
        translatedNames[i] = translated;
      }
    setState(() {
    });
  }

  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: CommandModel.commands.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.8,
      ),
      itemBuilder: (BuildContext context, int index) {
        final command = CommandModel.commands[index];
        final translatedName = translatedNames[index] ?? command.name;
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StmtPage(command: command, langCode: widget.langCode, langCodeSp: widget.langCodeSp, rate: widget.rate, pitch: widget.pitch, vol: widget.vol),
              ),
            );
          },
          child: CommandStmt(command: command, translatedName: translatedName),
        );
      },
    );
  }
}

class CommandStmt extends StatelessWidget {
  const CommandStmt({super.key, required this.command, required this.translatedName});
  final Command command;
  final String translatedName;

  @override
  Widget build(BuildContext context) {
    final textColor = invertColor(Theme.of(context).cardColor);
    return Material(
      color: context.cardColor,
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.5),
      borderRadius: BorderRadius.circular(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset(
                  command.icon,
                  height: 128,
                  width: 128,
                  fit: BoxFit.cover,
                  cacheHeight: 64,
                  cacheWidth: 64,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error, size: 40, color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 8),
            translatedName.text.bold.center.color(textColor).make(),
          ],
        ),
      ),
    );
  }
}
