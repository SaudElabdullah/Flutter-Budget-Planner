import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget(
      {@required this.text,
      @required this.size,
      this.color = Colors.white,
      this.fontWeight = FontWeight.normal,
      this.textAlign});

  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
