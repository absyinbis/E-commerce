import 'package:flutter/material.dart';

class AddCartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 44,
        width: 305,
        decoration: BoxDecoration(
          color: Color(0xffB4DCFE),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: Center(
          child: Text(
            "اضافة الي السلة",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
