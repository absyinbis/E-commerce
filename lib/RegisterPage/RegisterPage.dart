import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:post_storage/OTPPage/OTPPage.dart';
import 'package:post_storage/RegisterPage/RegisterBloc/RegisterBloc.dart';
import 'package:post_storage/RegisterPage/RegisterBloc/RegisterState.dart';
import 'package:post_storage/RegisterPage/Widget/LoginText.dart';
import 'package:post_storage/RegisterPage/Widget/PolicyCheck.dart';
import 'package:post_storage/RegisterPage/Widget/RegisterButton.dart';
import 'package:post_storage/core/Widget/InputText.dart';
import 'package:post_storage/core/Widget/TitleText.dart';
import 'package:post_storage/core/Widget/WelcomeText.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context){
          return BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(),
            child: BlocListener<RegisterBloc,RegisterState>(
              child: BlocBuilder<RegisterBloc,RegisterState>(
                builder: (context,_){
                  final register = BlocProvider.of<RegisterBloc>(context);
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 35,
                      left: 35,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 140,
                          ),
                          TitleText(title: "مرحبا بك",),
                          WelcomeText(text: "أنشي حساب للاستمرار",),
                          SizedBox(
                            height: 40,
                          ),
                          InputText(label: "رقم الهاتف",hint: "رقم الهاتف",suffixIcon: Icons.mobile_screen_share_sharp,have: false,controller: register.phoneNumber,),
                          SizedBox(
                            height: 40,
                          ),
                          InputText(label: "الاسم",hint: "الاسم",suffixIcon: Icons.supervised_user_circle,have: true,prefixIcon: Icons.check,controller: register.name,),
                          SizedBox(
                            height: 24,
                          ),
                          InputText(label: "كلمة المرور",hint: "كلمة المرور",suffixIcon: Icons.lock,have: true,prefixIcon: Icons.remove_red_eye,controller: register.password,),
                          SizedBox(
                            height: 16,
                          ),
                          PolicyCheck(),
                          SizedBox(
                            height: 36,
                          ),
                          GestureDetector(
                            child: RegisterButton(title: "تسجيل الحساب",icon: Icon(Icons.transit_enterexit),),
                            onTap: () async {
                              //Navigator.push(context, MaterialPageRoute(builder: (_)=> OTPPage()));
                              //register.add(Register());
                              EasyLoading.show(status: 'loading...');
                              String id;
                              await FirebaseAuth.instance.verifyPhoneNumber(
                                phoneNumber: "+218"+register.phoneNumber.text,
                                verificationCompleted: (done) {

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
                                  id = verificationId;
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OTPPage(id: id,name: register.name.text,password: register.password.text,phoneNumber: register.phoneNumber.text,),),);
                                },
                                timeout: Duration(seconds: 60),
                                codeAutoRetrievalTimeout: (time) {},
                              );
                              EasyLoading.dismiss();
                            },
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: LoginText(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              listener: (_,state){
                if(state is RegisterError)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                      backgroundColor: Colors.red,
                    ),
                  );
              },
            ),
          );
        },
      ),
    );
  }
}
