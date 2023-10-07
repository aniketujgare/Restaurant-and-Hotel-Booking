import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../models/menu_model.dart';
import '../../../models/restaurant_model.dart';
import '../../../size_config.dart';
// import '../../../models/restaurant.dart';
import 'food_item.dart';

class FoodListView extends StatelessWidget {
  const FoodListView(
      this.selected, this.callback, this.pageController, this.foodMenu,
      {Key? key})
      : super(key: key);
  final int selected;
  final Function callback;
  final PageController pageController;
  final RxMap<String, List<Menu>> foodMenu;

  @override
  Widget build(BuildContext context) {
    final List<String> category = foodMenu.keys.toList();
    // print(restaurant.menu['Snacks']![selected]);
    // print(restaurant.menu['Snacks']![0].name);
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) {
          callback(index);
        },
        children: category.map((cat) {
          debugPrint(foodMenu[cat]!.length.toString());
          return ListView.separated(
            itemCount: foodMenu[cat]!.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => FoodItem(foodMenu[cat]![index]),
            separatorBuilder: (_, index) =>
                SizedBox(height: getProportionateScreenHeight(15)),
          );
        }).toList(),
      ),
    );
  }
}
