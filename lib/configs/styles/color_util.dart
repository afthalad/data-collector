import 'package:flutter/material.dart';

class ColorUtils {
  static const LinearGradient appBackgroundColor = LinearGradient(
    colors: [Color(0xff000412), Color(0xff09183e)],
    stops: [0.25, 0.9],
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );
  static const Color primaryColor = Color(0xFFf74746);
  static const Color buttonColors = Color(0xff5a189a);
  static const Color transparentColor = Colors.transparent;
}
