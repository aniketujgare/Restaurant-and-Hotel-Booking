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
                //     onPressed: () async {
                //       Food _food = Food("imgUrl", "desc", "name", "waitTime",
                //           4.8, "456", 215, 12, "about");

                //       Map<String, List<Food>> flist = {
                //         'Snacks': [_food]
                //       };
                //       var i = Database.db
                //           .collection('restaurant')
                //           .doc('jkLvqyLif4GqtG0WFhmA')
                //           .get()
                //           .then(
                //         // ignore: avoid_print
                //         (res) {
                //           Restaurantt rest = Restaurantt(
                //               res['name'],
                //               res['waitTime'],
                //               res['distance'],
                //               res['label'],
                //               res['logoUrl'],
                //               res['desc'],
                //               4.7,
                //               flist);
                //           print(rest.menu.length);

                //           // Database().addFoodDish(rest);
                //         },
                //         // print(res['menu']['Snacks'][0]['name']),
                //         // ignore: avoid_print
                //         onError: (e) => print("Error completing: $e"),
                //       );
                //       // print(i['menu']);
                //       // Database().addFoodDish(restaurant);
                //     },
                //     child: const Icon(Icons.add),),
              ],
            ),
          ),
        ));
  }
}
