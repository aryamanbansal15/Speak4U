import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speak4u/utils/invert.dart';
import 'package:velocity_x/velocity_x.dart';

class StmtHeader extends StatelessWidget {
  const StmtHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = invertColor(Theme.of(context).cardColor);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Commonly Used Phrases".text.xl5.center.fontFamily(GoogleFonts.birthstone().fontFamily!).color(textColor).make(),
      ],
    );
  }
}
