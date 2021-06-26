import 'package:flutter/material.dart';

class DropDownMenu extends StatelessWidget {

  const DropDownMenu({this.label});
  final label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xff8F92A1),
            fontFamily: "Changa",
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: Color(0xffF3F6F8),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: DropdownButton(
                    hint: Text("اضافة"),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                    isExpanded: true,
                    onChanged: (value) {
                      print(value);
                    },
                    items: [
                      "a",
                      "b",
                    ].map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Container(
              height: 44,
              decoration: BoxDecoration(
                color: Color(0xffF3F6F8),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Icon(Icons.flag),
            ),
          ],
        ),
      ],
    );
  }
}
