import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Container(
        child: Center(
          child: Text(
            "اضافة منتج",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Color(0xff171717),
              fontFamily: "Changa",
            ),
          ),
        ),
      ),
    );
  }
}
