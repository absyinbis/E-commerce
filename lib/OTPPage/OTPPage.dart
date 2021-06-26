import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:post_storage/OTPPage/Widget/CheckOTPButton.dart';
import 'package:post_storage/app_base.dart';

import 'package:post_storage/core/Widget/TitleText.dart';
import 'package:post_storage/core/Widget/WelcomeText.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({this.id,this.name,this.password,this.phoneNumber});
  final String id,name,password,phoneNumber;

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {

  TextEditingController code = TextEditingController();

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
              TitleText(title: "كلمة المرور لمرة واحدة (OTP)",),
              WelcomeText(text: "تم ارسال رمز التحقق الى",),
              WelcomeText(text: "+218"+widget.phoneNumber,),
              SizedBox(
                height: 40,
              ),
              PinCodeTextField(
                appContext: context,
                controller: code,
                length: 6,
                cursorColor: Colors.grey,
                onChanged: (s){
                  print(s);
                },
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(inactiveColor: Colors.grey),
              ),
              SizedBox(
                height: 68,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    final authCredential =
                        await FirebaseAuth.instance.signInWithCredential(
                        PhoneAuthProvider.credential(
                            verificationId: widget.id, smsCode: code.text)
                    );

                    if(authCredential?.user != null){
                      String uid = authCredential.user.uid;
                      FirebaseFirestore.instance.collection("users").doc(uid).set(
                          {
                            "password" : widget.password,
                            "name" : widget.name,
                            "phoneNumber" : widget.phoneNumber,
                            "permission" : "user",
                          });
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AppBase(),),);
                    }

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
                child: CheckOTPButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

