import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({this.title});
  final title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Changa",

      ),
      textDirection: TextDirection.rtl,
    );
  }
}
