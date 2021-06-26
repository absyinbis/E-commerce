
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_storage/AddPage/AddBloc/AddEvent.dart';
import 'package:post_storage/AddPage/AddBloc/AddState.dart';

class AddBloc extends Bloc<AddEvent,AddState> {
  AddBloc() : super(Loading());

  @override
  Stream<AddState> mapEventToState(AddEvent event) async* {

    if(event is LoadPage){
      final QuerySnapshot<Map<String, dynamic>> dataBrand = await FirebaseFirestore.instance.collection("brand").get();
      final List<String> brand = dataBrand.docs.map<String>((brand) => brand.id).toList();
      final QuerySnapshot<Map<String, dynamic>> dataCategory = await FirebaseFirestore.instance.collection("category").get();
      final List<String> category = dataCategory.docs.map<String>((category) => category.id).toList();
      yield Loaded(brand: brand,category: category);
    }
  }

}