

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_storage/core/Application/AuthenticationBloc/AuthEvent.dart';
import 'package:post_storage/core/Application/AuthenticationBloc/AuthState.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState> {
  AuthBloc() : super(Loading());


  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if(event is Check){
      yield Loading();
      await Future.delayed(Duration(seconds: 2));
      if (FirebaseAuth.instance.currentUser != null) {
        yield Login();
      } else {
        yield Logout();
      }
    }

    if(event is SingIn){

    }

    if(event is SingUp){

    }

  }

}