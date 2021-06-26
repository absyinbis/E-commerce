import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Color(0xff171717),
        fontFamily: "Changa",
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textDirection: TextDirection.rtl,
    );
  }
}
