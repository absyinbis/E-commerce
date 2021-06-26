import 'package:post_storage/Item.dart';

abstract class HomeState{}

class Loading extends HomeState {}

class Loaded extends HomeState {

  Loaded({this.items});

  List<Item> items;
}
