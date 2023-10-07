import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/food_screen_app_bar.dart';
import '../../getx_controller/restaurants_controller.dart';
import '../../size_config.dart';
import 'widgets/restaurant_card_swi.dart';

class FoodScreenPage extends StatelessWidget {
  const FoodScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RestaurantController restaurantController =
        Get.put(RestaurantController());
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
            restaurantController.obx((state) {
              if (state is RestaurantsModelLoaded) {
                var listRestaurants = state.restaurnatModel.restaurants;
                return Expanded(
                  child: ListView.builder(
                    itemCount: listRestaurants.length,
                    itemBuilder: (context, index) {
                      var restaurant = listRestaurants[index];

                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(14),
                            vertical: getProportionateScreenHeight(8)),
                        child: RestaurantCardSwi(
                          restaurant: restaurant,
                        ),
                      );
                    },
                  ),
                );
              }
              return const Text('Error Ocuured');
            }),
          ],
        ));
  }
}
