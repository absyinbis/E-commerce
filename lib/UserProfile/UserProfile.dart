import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:post_storage/UserProfile/Widget/CardOrder.dart';
import 'package:post_storage/app_base.dart';

class UserProfile extends StatelessWidget {
  const UserProfile();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color(0xffB4DCFE),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 35,
          left: 35,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 68,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) => AppBase()));
                  },
                  icon: Icon(Icons.logout),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Image.asset("assets/images/Image.png"),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "المستخدم",
                        style: TextStyle(
                          fontFamily: "Changa",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "0920000000",
                        style: TextStyle(
                          fontFamily: "Changa",
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 36,
            ),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('order').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    final data =  snapshot.data.docs.where((element) => element.get("userId") == FirebaseAuth.instance.currentUser.uid).toList();
                    return ListView(
                      children: [
                        ...data.map((e) => CardOrder()),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
