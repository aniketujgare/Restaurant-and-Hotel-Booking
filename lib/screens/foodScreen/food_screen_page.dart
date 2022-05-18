import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:resto_hoel_book/models/food.dart';
import 'package:resto_hoel_book/models/restaurantt.dart';
import '../../components/food_screen_app_bar.dart';
import '../../services/database.dart';
import '../../size_config.dart';
import 'widgets/restaurant_card.dart';

class FoodScreenPage extends StatelessWidget {
  const FoodScreenPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const FoodScreenAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: getProportionateScreenWidth(24),
                top: getProportionateScreenWidth(14),
              ),
              child: const Text(
                'Restaurants around you',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(14)),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: Database().getRestaurantStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView(
                        children: snapshot.data!.docs.map((e) {
                          Map<String, List<Food>> _foodList = {};

                          List<String> _keys = [];
                          e['menu'].keys.forEach((k) => _keys.add(k));
                          for (var category in _keys) {
                            List<Food> _dishList = [];
                            int _noOfDishes = e['menu'][category].length;
                            for (int dishNo = 0;
                                dishNo < _noOfDishes;
                                dishNo++) {
                              Food _food = Food(
                                  e['menu'][category][dishNo]['imgUrl'],
                                  e['menu'][category][dishNo]['desc'],
                                  e['menu'][category][dishNo]['name'],
                                  e['menu'][category][dishNo]['waitTime'],
                                  e['menu'][category][dishNo]['score'],
                                  // 4.5,
                                  e['menu'][category][dishNo]['cal'],
                                  int.parse(
                                      e['menu'][category][dishNo]['price']),
                                  // 45,

                                  e['menu'][category][dishNo]['quantity'],
                                  // 45,
                                  e['menu'][category][dishNo]['about']);

                              _dishList.add(_food);
                            }
                            _foodList.addAll({category: _dishList});
                            // print(_foodList['Snacks']![0].name);
                          }
                          Restaurantt rest = Restaurantt(
                              e['name'],
                              e['waitTime'],
                              e['distance'],
                              e['label'],
                              e['logoUrl'],
                              e['desc'],
                              double.parse(e['score']),
                              _foodList);
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(14),
                                vertical: getProportionateScreenHeight(10)),
                            child: RestaurantCard(
                              restaurant: rest,
                            ),
                          );
                        }).toList(),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return const Text('no data');
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        )

        // StreamBuilder(
        //   stream: Database().getRestaurantStream(),
        //   builder: (context, snapshot) {
        //     if (!snapshot.hasData) {
        //       return const CircularProgressIndicator();
        //     } else {
        //       <DocumentSnapshot> items = snapshot.data;
        //       return const Text('GOt the data');
        //     }
        //   },
        // )

        //     SingleChildScrollView(
        //         child: Padding(
        //   padding: EdgeInsets.all(getProportionateScreenWidth(14)),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Padding(
        //         padding: EdgeInsets.symmetric(
        //             horizontal: getProportionateScreenWidth(10)),
        //         child: const Text(
        //           'Restaurants around you',
        //           style: TextStyle(
        //             fontSize: 18,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ),
        //       SizedBox(height: getProportionateScreenHeight(14)),
        //       Padding(
        //         padding: EdgeInsets.symmetric(
        //             horizontal: getProportionateScreenWidth(2),
        //             vertical: getProportionateScreenHeight(8)),
        //         child: const RestaurantCard(
        //           name: 'Dynamite Rolls',
        //           description: 'Rolls, Fast Food, Pizza',
        //           image: 'assets/images/resto1.jpg',
        //           price: 250,
        //         ),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.symmetric(
        //             horizontal: getProportionateScreenWidth(2),
        //             vertical: getProportionateScreenHeight(8)),
        //         child: StreamBuilder<QuerySnapshot>(
        //           stream: Database().getRestaurantStream(),
        //           builder: (ontext, snapshot) {
        //             if (snapshot.hasData) {
        //               if (snapshot.connectionState == ConnectionState.waiting) {
        //                 return const Center(
        //                   child: LinearProgressIndicator(),
        //                 );
        //               } else {
        //                 return ListView(
        //                   children: snapshot.data!.docs
        //                       .map((e) => Card(
        //                             child: Text(e.data().toString()),
        //                           ))
        //                       .toList(),
        //                 );
        //               }
        //             } else if (snapshot.hasError) {
        //               return const Text('no data');
        //             }
        //             return const CircularProgressIndicator();
        //           },
        //         ),
        //         // const RestaurantCard(
        //         //   name: 'Khao Lite',
        //         //   description: 'Healthy Food, Rolls, Fast Food',
        //         //   image: 'assets/images/resto3.jpg',
        //         //   price: 150,
        //         // ),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.symmetric(
        //             horizontal: getProportionateScreenWidth(2),
        //             vertical: getProportionateScreenHeight(8)),
        //         child: const RestaurantCard(
        //           name: 'The Mishti Box',
        //           description: 'Mithai, Desserts',
        //           image: 'assets/images/resto2.jpg',
        //           price: 350,
        //         ),
        //       ),
        //     ],
        //   ),
        // )),
        );
  }
}
