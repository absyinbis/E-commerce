import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:post_storage/DetailsPage/Widget/AddCartButton.dart';
import 'package:post_storage/DetailsPage/Widget/Price.dart';
import 'package:post_storage/DetailsPage/Widget/SubjectText.dart';
import 'package:post_storage/DetailsPage/Widget/TextBody.dart';
import 'package:post_storage/DetailsPage/Widget/TitleText.dart';
import 'package:post_storage/LoginPage/LoginPage.dart';

class DetailsPage extends StatelessWidget {

  const DetailsPage({this.brand,this.category,this.sku,this.address,this.description,this.price,this.image,this.itemId});
  final brand,category,sku,address,description,price,image,itemId;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                      sku.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Changa",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff171717),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_sharp),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 345,
                        height: 370,
                        child: Stack(
                          children: [
                            Positioned(
                              child: SvgPicture.asset("assets/images/Base.svg"),
                              bottom: 0,
                            ),
                            Center(child: Image.network(image,width: 300,height: 300,)),
                          ],
                        ),
                      ),

                      TitleText(title: brand,),
                      TextBody(body: category,),
                      SubjectText(subject: "تلفزيون Q80t QLED الذكي الطراز 85 |2020",),
                      TextBody(body: description,),
                      Price(price: price,),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () async {
                          EasyLoading.show(status: 'loading...');
                          if(FirebaseAuth.instance.currentUser != null) {
                            final QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
                                .collection("cart")
                                .get();
                            final QueryDocumentSnapshot<Map<String, dynamic>> result =
                            data.docs.firstWhere(
                                    (element) => element.get("itemId") == itemId.toString() && element.get("userId") == FirebaseAuth.instance.currentUser.uid,
                                orElse: () => null);
                            if(result == null){
                              FirebaseFirestore.instance.collection("cart").add(
                                  {
                                    "itemId" : itemId,
                                    "details" : description,
                                    "sku" : sku,
                                    "price" : price,
                                    "image" : image,
                                    "userId" : FirebaseAuth.instance.currentUser.uid,
                                    "quantity" : "1",
                                  }
                              );
                            }else{
                              print("its in");
                            }
                          }else
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                          EasyLoading.dismiss();
                        },
                        child: AddCartButton(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
