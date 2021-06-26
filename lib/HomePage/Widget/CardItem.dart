import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({this.title, this.price, this.image});

  final title, price, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 145,
        height: 209,
        decoration: BoxDecoration(
          color: Color(0xffF3F6F8),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Spacer(),
              Image.network(
                image,
                height: 98,
                width: 123,
              ),
              Spacer(),
              Text(
                title,
                style: TextStyle(
                  color: Color(0xff171717),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Changa"
                ),
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
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      color: Color(0xff171717),
                      fontSize: 12,
                      fontFamily: "Changa",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
