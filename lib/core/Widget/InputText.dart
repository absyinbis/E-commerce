import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({this.label,this.controller,this.hint,this.prefixIcon,this.suffixIcon,this.have});
  final String label,hint;
  final TextEditingController controller;
  final IconData suffixIcon,prefixIcon;
  final bool have;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: Color(0xff8F92A1),
            fontFamily: "Changa",
          ),
        ),
        Container(
          height: 44,
          child: TextFormField(
            controller: controller,
            textDirection: TextDirection.rtl,
            decoration: InputDecoration(
              hintText: hint,
              hintTextDirection: TextDirection.rtl,
              contentPadding: EdgeInsets.only(top: 10, bottom: 10),
              filled: true,
              fillColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              prefixIcon: have == true ? Icon(prefixIcon,color: Color(0xff171717),) : null,
              suffixIcon: Icon(suffixIcon,color: Color(0xff171717),),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff8F92A1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
