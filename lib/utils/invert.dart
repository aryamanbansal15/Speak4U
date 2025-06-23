import 'package:flutter/material.dart';

Color invertColor(Color color) {
  return Color.fromARGB(
    color.alpha,                      // Keep original alpha (transparency)
    255 - color.red,                 // Invert red
    255 - color.green,               // Invert green
    255 - color.blue,                // Invert blue
  );
}
