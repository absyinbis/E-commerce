import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Price extends StatelessWidget {

  const Price({this.price});
  final price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " دينار",
                  style: TextStyle(
                    color: Color(0xff171717).withOpacity(0.5),
                    fontSize: 8,
                    fontFamily: "Changa",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  price.toString(),
                  style: TextStyle(
                    color: Color(0xff171717),
                    fontSize: 12,
                    fontFamily: "Changa",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  " دينار",
                  style: TextStyle(
                    color: Color(0xff171717).withOpacity(0.5),
                    fontSize: 8,
                    fontFamily: "Changa",
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                Text(
                  price.toString(),
                  style: TextStyle(
                    color: Color(0xff171717),
                    fontSize: 12,
                    fontFamily: "Changa",
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          width: 60,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Color(0xffF3F6F8),
          ),
          child: Center(
            child: Text(
              "نفذت الكمية",
              style: TextStyle(
                color: Color(0xff171717).withOpacity(.5),
                fontWeight: FontWeight.bold,
                fontSize: 10,
                fontFamily: "Changa",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
