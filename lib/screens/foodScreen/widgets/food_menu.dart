import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_hoel_book/models/cart_controller.dart';
import 'package:resto_hoel_book/models/restaurantt.dart';
import 'package:resto_hoel_book/size_config.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../components/custom_app_bar.dart';
import '../../../constants/colors.dart';
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
  final cartController = Get.put(CartController());
  var selected = 0;
  final pageController = PageController();
  // final restaurant = Restaurant.generateRestaurant();
  final Restaurantt rest = Get.arguments;
  @override
  @override
  Widget build(BuildContext context) {
    // print(rest.menu.toString());
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
            pageController.jumpToPage(selected);
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
              count: rest.menu.length,
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
      floatingActionButton: Obx(
        () => Visibility(
          visible: (cartController.cartQuantity > 0) ? true : false,
          child: SizedBox(
            width: getProportionateScreenWidth(100),
            height: getProportionateScreenHeight(56),
            child: RawMaterialButton(
              fillColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  getProportionateScreenWidth(50),
                ),
              ),
              onPressed: () {
                // Get.bottomSheet(
                //   Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Column(
                //       mainAxisSize: MainAxisSize.max,
                //       children: const [
                //         ListTile(
                //           title: Text("Option 1"),
                //           trailing: Icon(Icons.access_alarms),
                //         ),
                //         ListTile(
                //           title: Text("Option 2"),
                //           trailing: Icon(Icons.ac_unit),
                //         ),
                //         ListTile(
                //           title: Text("Option 3"),
                //           trailing: Icon(Icons.present_to_all_sharp),
                //         ),
                //         ListTile(
                //           title: Text("Option 4"),
                //           trailing: Icon(Icons.keyboard),
                //         ),
                //       ],
                //     ),
                //   ),
                //   elevation: 20.0,
                //   enableDrag: false,
                //   isScrollControlled: true,
                //   backgroundColor: Colors.white,
                //   // shape: const RoundedRectangleBorder(
                //   //   borderRadius: BorderRadius.only(
                //   //     topLeft: Radius.circular(30.0),
                //   //     topRight: Radius.circular(30.0),
                //   //   ),
                //   // ),
                // );
              },
              elevation: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Obx(
                      () => Text(
                        // food.quantity.toString(),
                        cartController.cartQuantity.toString(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
