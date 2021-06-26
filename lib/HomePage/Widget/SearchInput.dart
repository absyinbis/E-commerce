import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Color(0xffF3F6F8),
        borderRadius: BorderRadius.all(Radius.circular(12),),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          cursorColor: Colors.black,
          decoration: new InputDecoration(
              suffixIcon: Icon(Icons.close,color: Colors.black,size: 24,),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              hintText: "Hint here",
          ),
        ),
      )
    );
  }
}
