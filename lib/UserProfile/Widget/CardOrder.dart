import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CardOrder extends StatelessWidget {
  const CardOrder();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Container(
        width: 305,
        height: 313,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "قيد المراجعة",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      fontFamily: "Changa",
                    ),
                  ),
                  Text(
                    "طلب #1234",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      fontFamily: "Changa",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Color(0xffF3F6F8),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "طلبك الان قيد المراجعة",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: "Changa",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "سيتم اشعارك فورا عند تعير الحالة",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Changa",
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: 145,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Color(0xffB4DCFE),
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Center(
                      child: Text(
                        "التفاصيل",
                        style: TextStyle(
                          fontFamily: "Changa",
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
