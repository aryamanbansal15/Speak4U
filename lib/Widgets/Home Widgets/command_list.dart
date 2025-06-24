import 'package:flutter/material.dart';
import 'package:speak4u/Models/commands.dart';
import 'package:speak4u/Pages/stmt.dart';
import 'package:velocity_x/velocity_x.dart';

class CommandList extends StatelessWidget {
  const CommandList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CommandModel.commands.length,
      itemBuilder: (context, index) {
        final command = CommandModel.commands[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StmtPage(command: command),
            ),
          ),
          child: CommandStmt(command: command),
        );
      },
    );
  }
}


class CommandStmt extends StatelessWidget {
  const CommandStmt({super.key, required this.command});

  final Command command;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      command.icon,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error, size: 40, color: Colors.red),
                    ),
                  ),
                  command.name.text.bold.xl2.color(Colors.black).make().px4(),
                ],
              )
            )
          ],
        ),
      )
    );
  }
}
