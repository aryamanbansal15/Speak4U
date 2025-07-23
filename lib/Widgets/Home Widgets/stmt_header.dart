import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speak4u/utils/invert.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Models/messages.dart';
import '../../utils/translate.dart';

class StmtHeader extends StatefulWidget {
  final String langCode;
  final List<Message> messages;
  const StmtHeader({super.key, required this.langCode, required this.messages});

  @override
  State<StmtHeader> createState() => _StmtHeaderState();
}

class _StmtHeaderState extends State<StmtHeader> {

  // String commonPhrases = "Commonly Used Phrases";

  @override
  void initState() {
    super.initState();
    // translate(commonPhrases, widget.langCode);
  }

  // void translate(String text, String langCode) async {
  //   String result = await Translate().translate(text, langCode);
  //   setState(() {
  //     commonPhrases = result; // ✅ Corrected
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final message = widget.messages[0];
    final textColor = invertColor(Theme.of(context).cardColor);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        message.commonPhrases.text.xl5.center
            .fontFamily(GoogleFonts.birthstone().fontFamily!)
            .color(textColor).make(),
      ],
    );
  }
}
