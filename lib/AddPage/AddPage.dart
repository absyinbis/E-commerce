import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:post_storage/AddPage/AddBloc/AddBloc.dart';
import 'package:post_storage/AddPage/AddBloc/AddEvent.dart';
import 'package:post_storage/AddPage/AddBloc/AddState.dart';
import 'package:post_storage/AddPage/Widget/AddButton.dart';
import 'package:post_storage/AddPage/Widget/FirstLable.dart';
import 'package:post_storage/AddPage/Widget/InputData.dart';
import 'package:post_storage/AddPage/Widget/TitleText.dart';
import 'package:post_storage/app_base.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String brand;
  String category;
  TextEditingController sku = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  String file = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddBloc>(
      create: (_) => AddBloc()..add(LoadPage()),
      child: Scaffold(
        body: BlocConsumer<AddBloc, AddState>(
          listener: (_, state) {},
          builder: (_, state) {
            if (state is Loaded)
              return Container(
                color: Color(0xFFFFFFFF),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 35,
                    right: 35,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 62,
                      ),
                      Row(
                        children: [
                          TitleText(),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                await FirebaseAuth.instance.signOut();
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(builder: (_) => AppBase()));
                              },
                              child: Container(
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/arrow-long-left.png",
                                    height: 24,
                                    width: 24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 46,
                      ),
                      FirstLable(),
                      SizedBox(
                        height: 17,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "العلامة التجارية",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff8F92A1),
                                      fontFamily: "Changa",
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 44,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF3F6F8),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              topLeft: Radius.circular(15),
                                            ),
                                          ),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                right: 15,
                                                left: 8,
                                              ),
                                              child: DropdownButtonFormField(
                                                value: brand,
                                                icon: Icon(
                                                  Icons.arrow_downward_sharp,
                                                  color: Colors.black,
                                                ),
                                                decoration: InputDecoration(
                                                  hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily: "Changa",
                                                  ),
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.transparent),
                                                  ),
                                                ),
                                                hint: Text(
                                                  "إختر",
                                                ),
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                ),
                                                isExpanded: true,
                                                onChanged: (value) {
                                                  setState(() {
                                                    brand = value;
                                                  });
                                                },
                                                items: state.brand.map((value) {
                                                  return DropdownMenuItem(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: Color(0xffF3F6F8),
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                        ),
                                        child: Icon(Icons.flag_outlined),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "التصنيف",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff8F92A1),
                                      fontFamily: "Changa",
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 44,
                                          decoration: BoxDecoration(
                                            color: Color(0xffF3F6F8),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              topLeft: Radius.circular(15),
                                            ),
                                          ),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                right: 15,
                                                left: 8,
                                              ),
                                              child: DropdownButtonFormField(
                                                icon: Icon(
                                                  Icons.arrow_downward_sharp,
                                                  color: Colors.black,
                                                ),
                                                value: category,
                                                decoration: InputDecoration(
                                                  hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontFamily: "Changa",
                                                  ),
                                                  enabledBorder: UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.transparent),
                                                  ),
                                                ),
                                                hint: Text(
                                                  "إختر",
                                                ),
                                                isExpanded: true,
                                                onChanged: (value) {
                                                  setState(() {
                                                    category = value;
                                                  });
                                                },
                                                items: state.category.map((value) {
                                                  return DropdownMenuItem(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: Color(0xffF3F6F8),
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                        ),
                                        child: Icon(Icons.flag_outlined),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              InputData(
                                controller: sku,
                                label: "SKU",
                                onChange: (){
                                  setState(() {

                                  });
                                },
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              InputData(
                                controller: address,
                                label: "العنوان",
                                onChange: (){
                                  setState(() {

                                  });
                                },
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              InputData(
                                controller: description,
                                label: "الوصف",
                                onChange: (){
                                  setState(() {

                                  });
                                },
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              InputData(
                                controller: price,
                                label: "السعر",
                                onChange: (){
                                  setState(() {

                                  });
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () async {
                                    file = await ImagePicker.platform.pickImage(
                                        source: ImageSource.gallery,
                                        imageQuality: 50)
                                        .then((value) => file = value.path);

                                    setState(() {
                                      file = file;
                                    });
                                  },
                                  child: Image.asset(
                                    "assets/images/arrow-down-r.png",
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  EasyLoading.show(status: 'loading...');

                                  if (brand == "" ||
                                      category == "" ||
                                      address.text == "" ||
                                      description.text == "" ||
                                      sku.text == "" ||
                                      price.text == "" ||
                                      file == "") {
                                    EasyLoading.dismiss();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("الرجاء ملاء جميع الحقول"),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                    return;
                                  }

                                  final DocumentReference<Map<String, dynamic>> id =
                                  await FirebaseFirestore.instance
                                      .collection('store')
                                      .add({
                                    "sku": sku.text,
                                    "address": address.text,
                                    "description": description.text,
                                    "price": price.text,
                                    "brand": brand,
                                    "category": category,
                                  });

                                  UploadTask uploadTask = FirebaseStorage.instance
                                      .ref("")
                                      .child(id.id)
                                      .putFile(File(file));
                                  final TaskSnapshot task = await uploadTask.whenComplete((){});

                                  String url = await task.ref.getDownloadURL();
                                  id.update({"image": url});

                                  EasyLoading.dismiss();
                                },
                                child: AddButton(),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ),
      ),
    );
  }
}
