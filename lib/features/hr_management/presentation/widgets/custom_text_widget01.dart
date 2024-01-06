import 'package:flutter/material.dart';

class CustomTextWidget01 extends StatelessWidget {
  String textValue;
  Color fontColors;
  FontWeight fontWeight;
  double fontSize;
  CustomTextWidget01(
      {super.key,
      required this.textValue,
      this.fontColors = Colors.black,
      this.fontWeight = FontWeight.w400,
      this.fontSize = 15});

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: TextStyle(fontWeight: fontWeight, color: fontColors,
      fontSize: fontSize),
    );
  }
}
