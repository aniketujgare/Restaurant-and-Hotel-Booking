import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resto_hoel_book/models/food.dart';
import 'package:resto_hoel_book/models/restaurantt.dart';
import 'package:resto_hoel_book/screens/foodScreen/widgets/restaurant_card_swi.dart';
import '../../components/food_screen_app_bar.dart';
import '../../services/database.dart';
import '../../size_config.dart';

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
