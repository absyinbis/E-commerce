import 'package:flutter/material.dart';

class InputData extends StatelessWidget {

  const InputData({this.label,this.controller,this.onChange});
  final String label;
  final TextEditingController controller;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xff8F92A1),
            fontFamily: "Changa",
          ),
        ),
        Container(
          height: 44,
          child: TextFormField(
            onChanged: (string){
              onChange.call();
            },
            controller: controller,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 10, bottom: 10),
              filled: true,
              fillColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              prefixIcon: Icon(Icons.check,color: controller.text == "" ? Colors.grey : Colors.green,size: 20,),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: controller.text == "" ? Colors.grey : Color(0xff02C697),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
