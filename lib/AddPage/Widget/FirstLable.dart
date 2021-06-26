import 'package:flutter/material.dart';

class FirstLable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "اضافة",
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff8F92A1),
            fontFamily: "Changa",
          ),
        ),
        Text(
          "منتج جديد",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: "Changa",
            color: Color(0xff171717),
          ),
        ),
      ],
    );
  }
}
