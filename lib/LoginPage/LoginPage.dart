import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:post_storage/AddPage/AddPage.dart';
import 'package:post_storage/RegisterPage/RegisterPage.dart';
import 'package:post_storage/app_base.dart';
import 'package:post_storage/core/Widget/InputText.dart';
import 'package:post_storage/LoginPage/Widget/LoginButton.dart';
import 'package:post_storage/LoginPage/Widget/RegisterText.dart';
import 'package:post_storage/core/Widget/TitleText.dart';
import 'package:post_storage/core/Widget/WelcomeText.dart';

class LoginPage extends StatelessWidget {

  LoginPage();

  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 35,
          right: 35,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 148,
              ),
              TitleText(
                title: "تسجيل الدخول",
              ),
              WelcomeText(
                text: "مرحبا بك مجددا",
              ),
              SizedBox(
                height: 40,
              ),
              InputText(
                have: false,
                hint: "رقم الهاتف",
                label: "رقم الهاتف",
                suffixIcon: Icons.supervised_user_circle,
                controller: phoneNumber,
              ),
              SizedBox(
                height: 40,
              ),
              InputText(
                have: true,
                hint: "كلمة المرور",
                label: "كلمة المرور",
                suffixIcon: Icons.lock,
                prefixIcon: Icons.remove_red_eye,
                controller: password,
              ),
              SizedBox(
                height: 137,
              ),
              GestureDetector(
                onTap: () async {
                  EasyLoading.show(status: 'loading...');
                  final QuerySnapshot<Map<String, dynamic>> data =
                      await FirebaseFirestore.instance
                          .collection("users")
                          .get();
                  final QueryDocumentSnapshot<Map<String, dynamic>> result =
                      data.docs.firstWhere(
                          (element) =>
                              element.get("phoneNumber") == phoneNumber.text,
                          orElse: () => null);
                  if (result == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("الحساب غير موجود"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    if (password.text == result.get("password")) {
                       await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: "+218" + phoneNumber.text,
                        verificationCompleted: (done) {
                          //Navigator.pop(context);
                        },
                        verificationFailed: (failed) {
                          print(failed);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("توجد مشكلة"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                        codeSent: (verificationId, forceResendingToken) {
                          showDialog(
                            context: context,
                            builder: (e) => AlertDialog(
                              title: Text("Enter SMS Code"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  TextField(
                                    controller: code,
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  child: Text("Done"),
                                  onPressed: () async {
                                    try {
                                      FirebaseAuth auth = FirebaseAuth.instance;
                                      var _credential =  PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code.text.trim());
                                      UserCredential userCredential = await auth.signInWithCredential(_credential);
                                      DocumentSnapshot<Map<String, dynamic>> user = await FirebaseFirestore.instance.collection("users").doc(userCredential.user.uid).get();
                                      print(user.get("permission"));
                                      if(user.get("permission") != "admin")
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> AppBase()));
                                      else
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> AddPage()));

                                    } on FirebaseAuthException catch (e) {
                                      print(e);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text("الرمز غير صحيح"),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
                          );
                        },
                        timeout: Duration(seconds: 60),
                        codeAutoRetrievalTimeout: (time) {},
                      );
                    } else
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("اسم المستخدم او كلمة المرور غير صحيحة"),
                          backgroundColor: Colors.red,
                        ),
                      );
                  }
                  EasyLoading.dismiss();
                },
                child: LoginButton(
                  title: "تسجيل الدخول",
                  icon: Icon(Icons.transit_enterexit),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> RegisterPage()));
                  },
                  child: RegisterText()),
            ],
          ),
        ),
      ),
    );
  }
}
