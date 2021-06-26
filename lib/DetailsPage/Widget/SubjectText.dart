import 'package:flutter/material.dart';

class SubjectText extends StatelessWidget {
  const SubjectText({this.subject});
  final subject;
  @override
  Widget build(BuildContext context) {
    return Text(
      subject,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: "Changa",
      ),
      textDirection: TextDirection.rtl,
    );
  }
}