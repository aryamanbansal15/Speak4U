import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speak4u/utils/invert.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Models/commands.dart';
import '../../utils/speak.dart';
import '../../utils/translate.dart';

class StmtList extends StatefulWidget {
  const StmtList({super.key, required this.phrases, required this.langCode, required this.langCodeSp, required this.vol, required this.rate, required this.pitch});
  final List<String> phrases;
  final String? langCode;
  final String? langCodeSp;
  final vol;
  final rate;
  final pitch;

  @override
  State<StmtList> createState() => _StmtListState();
}

class _StmtListState extends State<StmtList> {
  Map<int, String> translatedPhrases = {};

  @override
  void initState() {
    super.initState();
    translate();
  }

  void translate() async {
    for (int i = 0; i < widget.phrases.length; i++) {
      final phrase = widget.phrases[i];
      final translated = await Translate().translate(phrase, widget.langCode!);
      translatedPhrases[i] = translated;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.phrases.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        final phrase = translatedPhrases[index] ?? widget.phrases[index];
        return InkWell(
          onTap: () async {
            await Speak.speak(phrase, widget.langCodeSp!, widget.rate, widget.pitch, widget.vol);
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
      color: Theme.of(context).cardColor,
      shadowColor: Colors.black.withOpacity(0.5),
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          "${phrase.isEmpty ? '...' : phrase} 🔊"
              .text
              .xl3
              .center
              .fontFamily(GoogleFonts.dmSerifText().fontFamily!)
              .color(textColor)
              .make(),
        ],
      ),
    );
  }
}
