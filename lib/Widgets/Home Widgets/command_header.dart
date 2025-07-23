import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speak4u/utils/invert.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Models/messages.dart';

class CommandHeader extends StatelessWidget {
  const CommandHeader({
    super.key,
    required this.langCode,
    required this.messages,
  });

  final String langCode;
  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    final textColor = invertColor(Theme.of(context).cardColor);

    final message = messages[0];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        message.tagline.text.bold.xl2.color(textColor).make(),
        const SizedBox(height: 30),

        message.common.text.xl5.center.color(textColor)
            .fontFamily(GoogleFonts.birthstone().fontFamily!)
            .make(),
      ],
    );
  }
}
