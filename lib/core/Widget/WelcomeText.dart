import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Color(0xff171717),
          fontFamily: "Changa",
          fontSize: 14,
          fontWeight: FontWeight.w500,
          shadows: [
            Shadow(
              color: Colors.grey,
              offset: Offset(0, 4),
              blurRadius: 4.0,
            ),
          ]),
      textDirection: TextDirection.rtl,
    );
  }
}
