

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_storage/HomePage/Bloc/HomeEvent.dart';
import 'package:post_storage/HomePage/Bloc/HomeState.dart';
import 'package:post_storage/Item.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc() : super(Loading());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if(event is Load){
      print("absy 1");
      yield Loading();
      print("absy 2");
      final QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance.collection("store").get();
      final List<Item> items = data.docs.map<Item>((item) => Item(
        sku: item.get("sku"),
        price: item.get("price"),
        description: item.get("description"),
        category: item.get("category"),
        address: item.get("address"),
        brand: item.get("brand"),
        image: item.get("image"),
        itemId: item.id,
      )).toList();

      yield Loaded(items: items);
      print("absy 4");
    }
  }

}

