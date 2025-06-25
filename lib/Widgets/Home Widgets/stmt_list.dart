import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speak4u/utils/invert.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../utils/speak.dart';

class StmtList extends StatelessWidget {
  const StmtList({super.key, required this.phrases});
  final List<String>phrases;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: phrases.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        final phrase = phrases[index];
        return InkWell(
          onTap: () {
            Speak.speak(phrase);
          },
          child: StmtPhrase(phrase: phrase),
        );
      },
    );
  }
}


class StmtPhrase extends StatelessWidget {
  const StmtPhrase({super.key, required this.phrase});
  final String phrase;

  @override
  Widget build(BuildContext context) {
    final textColor = invertColor(Theme.of(context).cardColor);
    return Material(
      elevation: 6,
      color: Colors.grey,
      shadowColor: Colors.black.withOpacity(0.5),
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            phrase.text.xl3.center.fontFamily(GoogleFonts.dmSerifText().fontFamily!).color(textColor).make(),
        ],
      ),
    );
  }
}
