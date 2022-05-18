import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_hoel_book/models/restaurantt.dart';
import 'package:resto_hoel_book/size_config.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../components/custom_app_bar.dart';
import '../../../constants/colors.dart';
import '../../../models/restaurant.dart';
import '../../home/widgets/food_list.dart';
import '../../home/widgets/food_list_view.dart';
import '../../home/widgets/restauratn_info.dart';

class FoodMenu extends StatefulWidget {
  const FoodMenu({Key? key}) : super(key: key);
  static String routName = '/food_menu';

  @override
  State<FoodMenu> createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  var selected = 0;
  final pageController = PageController();
  final restaurant = Restaurant.generateRestaurant();
  final Restaurantt rest = Get.arguments;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(14)),
            child: CustomAppBar(
              leftIcon: Icons.arrow_back_ios_outlined,
              rightIcon: Icons.search_outlined,
              leftCallBack: () {
                Get.back();
              },
            ),
          ),
          RestaurantInfo(restaurantt: rest),
          FoodList(selected, (int index) {
            setState(() {
              selected = index;
            });
            pageController.jumpToPage(index);
          }, rest),
          Expanded(
            child: FoodListView(
              selected,
              (int index) {
                setState(() {
                  selected = index;
                });
              },
              pageController,
              rest,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(25),
            ),
            height: getProportionateScreenHeight(50),
            child: SmoothPageIndicator(
              controller: pageController,
              count: restaurant.menu.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                    width: 8,
                    height: 8,
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8)),
                activeDotDecoration: DotDecoration(
                  width: 10,
                  height: 10,
                  color: kBackground,
                  borderRadius: BorderRadius.circular(10),
                  dotBorder: const DotBorder(
                    color: kPrimaryColor,
                    padding: 2,
                    width: 2,
                  ),
                ),
              ),
              // onDotClicked: (int index) => pageController.jumpTo(index),
            ),
          )
        ],
      ),
    );
  }
}
