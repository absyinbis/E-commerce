import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({this.title,this.icon});
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 44,
      decoration: BoxDecoration(
        color: Color(0xffB4DCFE),
        borderRadius: BorderRadius.all(Radius.circular(6))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              fontFamily: "Changa",
              color: Color(0xff171717),
            ),
          ),
          icon,
        ],
      ),
    );
  }
}
