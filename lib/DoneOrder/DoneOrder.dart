import 'package:flutter/material.dart';
import 'package:post_storage/app_base.dart';

class DoneOrder extends StatelessWidget {
  const DoneOrder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 62,
            width: MediaQuery.of(context).size.width,
          ),
          Text(
              "اتمام التسجيل",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              fontFamily: "Changa"
            ),
          ),
          SizedBox(
            height: 140,
          ),
          Image.asset("assets/images/Icon3.png"),
          SizedBox(
            height: 24,
          ),
          Text(
              "تم انشاء طلبك",
            style: TextStyle(
              fontFamily: "Changa",
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "سيتم التواصل معك قريبا",
            style: TextStyle(
              fontFamily: "Changa",
              fontSize: 14,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> AppBase()));
            },
            child: Container(
              height: 44,
              width: 305,
              decoration: BoxDecoration(
                color: Color(0xffB4DCFE),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Center(
                child: Text(
                  "استمرار",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontFamily: "Changa",
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
