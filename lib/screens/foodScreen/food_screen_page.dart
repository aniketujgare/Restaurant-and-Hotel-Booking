import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/food_screen_app_bar.dart';
import '../../models/food.dart';
import '../../models/restaurantt.dart';
import '../../services/database.dart';
import '../../size_config.dart';
import 'widgets/restaurant_card_swi.dart';

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
                          Map<String, List<Food>> foodList = {};

                          List<String> keys = [];
                          e['menu'].keys.forEach((k) => keys.add(k));
                          for (var category in keys) {
                            List<Food> dishList = [];
                            int noOfDishes = e['menu'][category].length;
                            for (int dishNo = 0;
                                dishNo < noOfDishes;
                                dishNo++) {
                              Food food = Food(
                                e['menu'][category][dishNo]['imgUrl'],
                                e['menu'][category][dishNo]['name'],
                                // 4.5,

                                int.parse(e['menu'][category][dishNo]['price']),
                                // 45,

                                // 45,
                                // e['menu'][category][dishNo]['about']
                              );

                              dishList.add(food);
                            }
                            foodList.addAll({category: dishList});
                            // print(foodList['Snacks']![0].name);
                          }
                          Restaurantt rest = Restaurantt(
                              e['name'],
                              e['waitTime'],
                              e['distance'],
                              e['label'],
                              e['logoUrl'],
                              e['desc'],
                              double.parse(e['score']),
                              foodList);
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(14),
                                vertical: getProportionateScreenHeight(8)),
                            child: RestaurantCardSwi(
                              restaurant: rest,
                            ),
                          );
                        }).toList(),
                      );
                    }
                  } else if (snapshot.hasError) {
                    return const Text('no data');
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ));
  }
}
