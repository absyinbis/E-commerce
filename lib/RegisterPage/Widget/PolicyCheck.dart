import 'package:flutter/material.dart';

class PolicyCheck extends StatelessWidget {
  const PolicyCheck();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "عند انشائك الي الحساب. انت توافق علي",
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 12,
                fontFamily: "Changa",
              ),
              textDirection: TextDirection.rtl,
            ),
            Text(
              "الشروط والاحكام",
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 12,
                fontFamily: "Changa",
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
        SizedBox(
          width: 16,
        ),
        Checkbox(
          value: true,
          tristate: false,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
