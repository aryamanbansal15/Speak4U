import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speak4u/utils/invert.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/translate.dart';

class CommandHeader extends StatefulWidget {
  const CommandHeader({super.key, required this.langCode});
  final String langCode;

  @override
  State<CommandHeader> createState() => _CommandHeaderState();
}

class _CommandHeaderState extends State<CommandHeader> {
  String commonCommands = "Commonly Used Commands";
  String tagline = "YOU THINK, WE SPEAK";

  @override
  void initState() {
    super.initState();
    translate(commonCommands, widget.langCode, (result)=> commonCommands = result);
    translate(tagline, widget.langCode, (result)=> tagline = result);
  }

  void translate(String text, String langCode, void Function(String) assign) async {
    String result = await Translate().translate(text, langCode);
    setState(() {
      assign(result);
    });
  }
  @override
  Widget build(BuildContext context) {
    final textColor = invertColor(Theme.of(context).cardColor);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tagline.text.bold.xl2.color(textColor).make(),
        SizedBox.fromSize(size: Size(20, 30)),
        commonCommands.text.xl5.center.color(textColor).fontFamily(GoogleFonts.birthstone().fontFamily!).make(),
      ],
    );
  }
}
