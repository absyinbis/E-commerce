import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {this.details,
      this.sku,
      this.price,
      this.itemCart,
      this.image,
      this.quantity});

  final details, sku, price, itemCart, image, quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Container(
        height: 148,
        decoration: BoxDecoration(
          color: Color(0xffF3F6F8),
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          details,
                          textDirection: TextDirection.rtl,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "Changa",
                          ),
                        ),
                        Text(
                          sku,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: "Changa",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "دينار ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 8,
                            fontFamily: "Changa",
                          ),
                        ),
                        Text(
                          price,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            fontFamily: "Changa",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () async {
                            EasyLoading.show(status: 'loading...');
                            int editQuantity = int.parse(quantity) + 1;
                            await FirebaseFirestore.instance
                                .collection("cart")
                                .doc(itemCart)
                                .update({"quantity": editQuantity.toString()});
                            EasyLoading.dismiss();
                          },
                          icon: Icon(Icons.add),
                        ),
                        Container(
                          height: 24,
                          width: 32,
                          color: Colors.white,
                          child: Center(child: Text(quantity)),
                        ),
                        IconButton(
                          onPressed: () {
                            EasyLoading.show(status: 'loading...');
                            int editQuantity = int.parse(quantity) - 1;
                            if (editQuantity == 0)
                              FirebaseFirestore.instance
                                  .collection("cart")
                                  .doc(itemCart)
                                  .delete();
                            else
                              FirebaseFirestore.instance
                                  .collection("cart")
                                  .doc(itemCart)
                                  .update(
                                      {"quantity": editQuantity.toString()});
                            EasyLoading.dismiss();
                          },
                          icon: Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Image.network(
                image,
                width: 88,
                height: 88,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
