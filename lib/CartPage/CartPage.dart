

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:post_storage/CartPage/Widget/AddressWidget.dart';
import 'package:post_storage/CartPage/Widget/CartItem.dart';
import 'package:post_storage/CartPage/Widget/PayTypeWidget.dart';
import 'package:post_storage/DoneOrder/DoneOrder.dart';

class CartPage extends StatefulWidget {
  CartPage();


  final TextEditingController address = TextEditingController();
  final int payType = 0;


  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cart').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else
          {
            var data;
            if(FirebaseAuth.instance.currentUser != null)
              data = snapshot.data.docs.where((element) => element.get("userId") == FirebaseAuth.instance.currentUser.uid).toList();
            else
              data = [];
            double sum = 0;
            data.forEach((element) {
              sum = sum +  double.parse(element.get("quantity"))  * double.parse(element.get("price"));
            });
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 35,
                  left: 35,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 62,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.view_week),
                        Text(
                          "السلة",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Changa",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_forward_outlined),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...data.map((cartItem){
                              return CartItem(
                                itemCart: cartItem.id,
                                details: cartItem.get("details"),
                                price: cartItem.get("price"),
                                sku: cartItem.get("sku"),
                                image: cartItem.get("image"),
                                quantity: cartItem.get("quantity"),
                              );
                            }),
                            if(data.isNotEmpty)
                              Column(
                                children: [
                                  SizedBox(
                                    height: 24,
                                  ),
                                  AddressWidget(address: widget.address,),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  PayTypeWidget(payType: widget.payType,),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              )
                            else
                              Container()
                          ],
                        ),
                      ),
                    ),
                    if(data.isNotEmpty)
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    sum.toString()+" دينار",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: "Changa",
                                    ),
                                  ),
                                  Text(
                                    "الكلي :",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: "Changa",
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  if(widget.address.text == ""){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("الرجاء ادخال العنوان"),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                    return;
                                  }
                                  EasyLoading.show(status: 'loading...');
                                  await FirebaseFirestore.instance.collection("order").add({ "userId" : FirebaseAuth.instance.currentUser.uid});
                                  data.forEach((element) async { await FirebaseFirestore.instance.collection("cart").doc(element.id).delete(); });
                                  EasyLoading.dismiss();
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=> DoneOrder()));
                                },
                                child: Container(
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: Color(0xffB4DCFE),
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "طلب",
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        fontFamily: "Changa",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      Container(),
                  ],
                ),
              ),
            );
          }
        }
    );

  }
}

