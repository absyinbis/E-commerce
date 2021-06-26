abstract class AuthEvent {}


class SingIn extends AuthEvent {}
class GoSingIn extends AuthEvent {}

class SingUp extends AuthEvent {}
class GoSingUp extends AuthEvent {}

class SingOut extends AuthEvent {}

class Check extends AuthEvent {}