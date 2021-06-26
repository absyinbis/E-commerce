import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_storage/DetailsPage/DetailsPage.dart';
import 'package:post_storage/HomePage/Bloc/HomeBloc.dart';
import 'package:post_storage/HomePage/Bloc/HomeEvent.dart';
import 'package:post_storage/HomePage/Bloc/HomeState.dart';
import 'package:post_storage/HomePage/Widget/CardItem.dart';
import 'package:post_storage/HomePage/Widget/SearchInput.dart';

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (_) => HomeBloc()..add(Load()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFFFFFFF),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SearchInput(),
                ),
                Container(
                  height: 1,
                  color: Color(0xff8F92A1),
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                  ),
                  child: Text(
                    "المنتجات",
                    style: TextStyle(
                        color: Color(0xff8F92A1),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Changa",
                        shadows: [
                          Shadow(
                            color: Colors.grey,
                            offset: Offset(0, 3),
                            blurRadius: 3.0,
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: state is Loaded
                        ? GridView.count(
                            crossAxisCount: 2,
                            children: state.items.map((item) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => DetailsPage(
                                        sku: item.sku,
                                        price: item.price.toString(),
                                        address: item.address,
                                        brand: item.brand,
                                        category: item.category,
                                        description: item.description,
                                        image: item.image,
                                        itemId : item.itemId
                                      ),
                                    ),
                                  );
                                },
                                child: CardItem(
                                  image: item.image,
                                  price: item.price.toString(),
                                  title: item.sku,
                                ),
                              );
                            }).toList(),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
