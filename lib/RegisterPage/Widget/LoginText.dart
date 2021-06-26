import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  const LoginText();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "التسجيل الدخول",
          style: TextStyle(
            color: Color(0xff171717),
            fontFamily: "Changa",
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "لديك حساب ؟ ",
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
