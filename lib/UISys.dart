import 'package:flutter/material.dart';

class Customs {
  static final Color red = Colors.black;
}

TextStyle textStyle(
    {required double fontsize,
    required Color color,
    FontWeight fontWeight = FontWeight.w500}) {
  return TextStyle(
    fontSize: fontsize,
    fontFamily: 'Mukta',
    color: color,
    fontWeight: fontWeight,
  );
}
