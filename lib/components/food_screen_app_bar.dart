import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_hoel_book/screens/signup%20screen/signup.dart';

import '../constants/colors.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(flex: 3),
                const Text(
                  "Foodiee",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(SignupScreen.routName);
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ));
  }
}
