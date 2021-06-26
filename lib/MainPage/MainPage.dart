import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:post_storage/CartPage/CartPage.dart';
import 'package:post_storage/DetailsPage/DetailsPage.dart';
import 'package:post_storage/HomePage/Home.dart';
import 'package:post_storage/UserProfile/UserProfile.dart';
import 'package:post_storage/custom_icon_icons.dart';

class MainPage extends StatefulWidget {
  const MainPage();


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  int index = 0;
  final List<Widget> tabs = [
    Home(),
    CartPage(),
    if(FirebaseAuth.instance.currentUser != null)
      UserProfile()
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link;
          print(dynamicLink.toString());
          print(deepLink);
          if (deepLink != null) {
            String itemId = deepLink.toString().substring(deepLink.toString().lastIndexOf("/")+1);
            print(itemId);
            DocumentSnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance.collection("store").doc(itemId).get();
            print(data.get("description"));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> DetailsPage(
                  address: data.get("address"),
                  image: data.get("image"),
                  sku: data.get("sku"),
                  price: data.get("price"),
                  brand: data.get("brand"),
                  category: data.get("category"),
                  description: data.get("description"),
                  itemId: itemId,
                ),
              ),
            );

            //Navigator.pushNamed(context, deepLink.path);
          }
        },
        onError: (OnLinkErrorException e) async {
          print("no");
          //Navigator.pushNamed(context, '/error');
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[index],
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                rippleColor: Colors.grey[300],
                hoverColor: Colors.grey[100],
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100],
                gap: 8,
                color: Colors.black,
                tabs: [
                  GButton(
                    icon: CustomIcon.home,
                    text: 'الرئيسية',
                    backgroundColor: Color(0xffB4DCFE),
                  ),
                  GButton(
                    icon: Icons.shopping_cart,
                    text: 'السلة',
                    backgroundColor: Color(0xffB4DCFE),
                  ),
                  if(FirebaseAuth.instance.currentUser != null)
                    GButton(
                      icon: CustomIcon.user,
                      text: 'المستخدم',
                      backgroundColor: Color(0xffB4DCFE),
                    ),
                ],
                selectedIndex: 0,
                onTabChange: (i){
                  setState(() {
                    index = i;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
