abstract class AddState {}

class Loaded extends AddState {
  Loaded({this.brand,this.category});
  List<String> brand,category;
}

class Loading extends AddState {}