import 'package:flutter/material.dart';

class TextInfo {
  String text;
  double left;
  double top;
  double right;
  Color color;
  FontWeight fontWeight;
  FontStyle fontStyle;
  double fontSize;
  TextAlign textAlign;

  TextInfo(this.text, this.left, this.top, this.right, this.color,
      this.fontWeight, this.fontStyle, this.fontSize, this.textAlign);
}