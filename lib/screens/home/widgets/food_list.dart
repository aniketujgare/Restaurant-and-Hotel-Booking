import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_hoel_book/constants/colors.dart';
import 'package:resto_hoel_book/screens/foodScreen/widgets/food_menu.dart';

import '../../../models/menu_model.dart';
import '../../../models/restaurant_model.dart';

class FoodList extends StatelessWidget {
  final int selected;
  final Function callback;
  final RxMap<String, List<Menu>> foodMenu;
  const FoodList(this.selected, this.callback, this.foodMenu, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(restaurant.menu.toString());
    final category = foodMenu.keys.toList();

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => callback(index),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selected == index ? kPrimaryColor : Colors.white,
            ),
            child: Text(
              category[index],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        separatorBuilder: (_, index) => const SizedBox(width: 20),
        itemCount: category.length,
      ),
    );
  }
}
