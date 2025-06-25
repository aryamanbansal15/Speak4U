import 'package:flutter/material.dart';
import 'package:speak4u/Models/commands.dart';
import 'package:speak4u/Pages/stmt.dart';
import 'package:speak4u/utils/invert.dart';
import 'package:velocity_x/velocity_x.dart';


class CommandList extends StatelessWidget {
  const CommandList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: CommandModel.commands.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        final command = CommandModel.commands[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StmtPage(command: command),
              ),
            );
          },
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
    final textColor = invertColor(Theme.of(context).cardColor);
    return Material(
      color: context.cardColor,
      elevation: 6,
      shadowColor: Colors.black.withOpacity(0.5),
      borderRadius: BorderRadius.circular(16),
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
          command.name.text.bold.center.color(textColor).make(),
        ],
      ),
    );
  }
}
