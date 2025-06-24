import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CommandHeader extends StatelessWidget {
  const CommandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Commonly Used Commands".text.bold.xl3.center.make(),
      ],
    );
  }
}
