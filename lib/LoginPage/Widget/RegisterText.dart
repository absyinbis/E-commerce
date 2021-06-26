import 'package:flutter/material.dart';

class RegisterText extends StatelessWidget {
  const RegisterText();


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "التسجيل",
          style: TextStyle(
            color: Color(0xff171717),
            fontFamily: "Changa",
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "ليس لديك حساب ؟ ",
          style: TextStyle(
            color: Color(0xff171717),
            fontFamily: "Changa",
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
