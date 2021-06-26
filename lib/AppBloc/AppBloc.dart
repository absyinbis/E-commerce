import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_storage/AppBloc/AppEvent.dart';
import 'package:post_storage/AppBloc/AppState.dart';

class AppBloc extends Bloc<AppEvent,AppState>{
  AppBloc() : super(Loading());

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if(FirebaseAuth.instance.currentUser != null){
      DocumentSnapshot<Map<String, dynamic>> user = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).get();
      if(user.get("permission") != "admin")
        yield Emp();
      else
        yield Admin();
    }else
      yield Guest();

  }

}