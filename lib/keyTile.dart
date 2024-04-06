import 'package:calculator_app/UISys.dart';
import 'package:flutter/material.dart';

Widget keyTile(
    {String keyValue = '',
    Color KeyBGColor = const Color(0x00ffffff),
    Color keyTextcolor = Colors.black}) {
  return SizedBox(
    height: 60,
    width: 60,
    child: InkWell(
      onTap: () {},
      child: CircleAvatar(
        backgroundColor: KeyBGColor,
        child: Text(
          keyValue,
          style: textStyle(
              fontsize: 24, color: keyTextcolor, fontWeight: FontWeight.w700),
        ),
      ),
    ),
  );
}
