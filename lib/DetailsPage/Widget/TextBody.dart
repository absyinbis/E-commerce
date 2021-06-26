import 'package:flutter/material.dart';

class TextBody extends StatelessWidget {
  const TextBody({this.body});
  final body;
  @override
  Widget build(BuildContext context) {
    return Text(
      body,
      style: TextStyle(
        fontSize: 12,
        color: Color(0xff8F92A1),
        fontFamily: "Changa",
      ),
      textDirection: TextDirection.rtl,
    );
  }
}
