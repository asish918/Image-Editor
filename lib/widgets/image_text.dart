import 'package:flutter/material.dart';
import 'package:image_editor/models/text_info.dart';

class ImageText extends StatelessWidget {
  final TextInfo textInfo;
  const ImageText({Key? key, required this.textInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        textInfo.text,
      textAlign: textInfo.textAlign,
      style: TextStyle(
        fontWeight: textInfo.fontWeight,
        fontSize: textInfo.fontSize,
        fontStyle: textInfo.fontStyle,
        color: textInfo.color
      ),
    );
  }
}
