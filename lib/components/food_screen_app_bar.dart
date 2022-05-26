import 'package:flutter/material.dart';
import 'package:resto_hoel_book/constants/colors.dart';
import 'package:resto_hoel_book/models/restaurant.dart';
import 'package:resto_hoel_book/models/restaurantt.dart';
import 'package:resto_hoel_book/services/database.dart';
import '../models/food.dart';

class FoodScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FoodScreenAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Food>> menu = {
      'Recommend': Food.generateRecommendFoods(),
      'Popular': Food.generatePopularFoods(),
      'Noodles': [],
      'Pizza': [],
    };

    final restaurant = Restaurant("ANiket", "10", "7", "dhasu", "logoUrl",
        "bhari tikhat mutton", 4.7, menu);

    return PreferredSize(
        preferredSize: preferredSize,
        //TODO:Add Foodie App bar
        child: Material(
          elevation: 3,
          child: Container(
            height: 80,
            width: double.infinity,
            color: kPrimaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  "Foodiee",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // TextButton(
                //   onPressed: () {
                //     //create restaurant
                //     Restaurantt rest = Restaurantt('name', 'waitTime',
                //         'distance', 'label', 'logoUrl', 'desc', 4.5, menu);
                //     // print(rest.toFirestore());
                //     Database.db
                //         .collection("cities")
                //         .doc("LA")
                //         .set(rest.toFirestore())
                //         .onError((e, _) => print("Error writing document: $e"));
                //   },
                //   child: const Icon(Icons.add),
                // ),
              ],
            ),
          ),
        ));
  }
}
