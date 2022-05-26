import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_hoel_book/models/restaurantt.dart';
import 'package:resto_hoel_book/screens/detail/food_detail_page.dart';
import 'package:resto_hoel_book/size_config.dart';

// import '../../../models/restaurant.dart';
import 'food_item.dart';

class FoodListView extends StatelessWidget {
  const FoodListView(
      this.selected, this.callback, this.pageController, this.restaurant,
      {Key? key})
      : super(key: key);
  final int selected;
  final Function callback;
  final PageController pageController;
  final Restaurantt restaurant;

  @override
  Widget build(BuildContext context) {
    final List<String> category = restaurant.menu.keys.toList();
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
        children: category
            .map<Widget>((cat) => ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) =>
                    FoodItem(restaurant.menu[cat]![index]),
                separatorBuilder: (_, index) =>
                    SizedBox(height: getProportionateScreenHeight(15)),
                itemCount: restaurant.menu[category[selected]]!.length))
            .toList(),
      ),
    );
  }
}
