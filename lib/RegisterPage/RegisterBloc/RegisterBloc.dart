import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_storage/RegisterPage/RegisterBloc/RegisterEvet.dart';
import 'package:post_storage/RegisterPage/RegisterBloc/RegisterState.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(null);

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  String id;

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is Register) {
      if (phoneNumber.text == "" || password.text == "" || name.text == "") {
        yield RegisterError(error: "املاء جميع الحقول");
      }
    }
  }
}
