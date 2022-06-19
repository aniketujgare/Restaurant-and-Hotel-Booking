import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resto_hoel_book/constants/colors.dart';
import 'package:resto_hoel_book/services/addDish.dart';

import '../services/database.dart';

class FoodScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FoodScreenAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    // final Map<String, List<Food>> menu = {
    //   'Recommend': Food.generateRecommendFoods(),
    //   'Popular': Food.generatePopularFoods(),
    //   'Noodles': [],
    //   'Pizza': [],
    // };

    // final restaurant = Restaurant("ANiket", "10", "7", "dhasu", "logoUrl",
    //     "bhari tikhat mutton", 4.7, menu);

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
              children: [
                const Text(
                  "Foodiee",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // print(rest.toFirestore());
                    Database.db
                        .collection("restaurant")
                        .doc("AIHhwOis5XtfweVeqt8a")
                        .set(
                            dish_add,
                            SetOptions(
                              merge: true,
                            ))
                        .onError((e, _) => print("Error writing document: $e"));
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ));
  }
}
