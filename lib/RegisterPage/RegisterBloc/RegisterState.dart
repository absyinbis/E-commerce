abstract class RegisterState {}

class Loading extends RegisterState {}

class Registred extends RegisterState {
}

class RegisterError extends RegisterState {
  RegisterError({this.error});
  String error;
}