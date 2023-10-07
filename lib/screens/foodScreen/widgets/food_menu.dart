import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_hoel_book/api/api.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../components/custom_app_bar.dart';
import '../../../constants/colors.dart';
import '../../../getx_controller/restaurant_menu_controller.dart';
import '../../../models/cart_controller.dart';
import '../../../models/restaurant_model.dart';
import '../../../size_config.dart';
import '../../detail/widget/cart_screen.dart';
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
  final pageController = PageController();
  final Restaurant restaurant = Get.arguments;
  final foodMenuController = Get.put(RestaurantMenuController());

  @override
  Widget build(BuildContext context) {
    foodMenuController.getRestMenu(restId: restaurant.id);
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(14)),
            child: CustomAppBar(
              leftIcon: Icons.arrow_back_ios_outlined,
              leftCallBack: () {
                Get.back();
              },
              rightIcon: Icons.add,
              rightCallBack: () {
                Get.bottomSheet(addNewMenu(),
                    backgroundColor: Colors.white, isScrollControlled: true);
              },
            ),
          ),
          RestaurantInfo(restaurantt: restaurant),
          Obx(() {
            if (foodMenuController.isLoading.value) {
              return const CircularProgressIndicator();
            } else {
              return FoodList(foodMenuController.selectedCategoryIndex.value,
                  (int index) {
                setState(() {
                  foodMenuController.selectedCategoryIndex.value = index;
                });
                pageController
                    .jumpToPage(foodMenuController.selectedCategoryIndex.value);
              }, foodMenuController.foodMenu);
            }
          }),
          Expanded(
            child: Obx(() {
              if (foodMenuController.isLoading.value) {
                return const CircularProgressIndicator();
              } else {
                return Obx(() => FoodListView(
                      foodMenuController.selectedCategoryIndex.value,
                      (int index) {
                        foodMenuController.selectedCategoryIndex.value = index;
                      },
                      pageController,
                      foodMenuController.foodMenu,
                    ));
              }
            }),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(25),
            ),
            height: getProportionateScreenHeight(50),
            child: Obx(() {
              if (foodMenuController.isLoading.value) {
                return const CircularProgressIndicator();
              } else {
                return SmoothPageIndicator(
                  controller: pageController,
                  count: foodMenuController.foodMenu.length,
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
                );
              }
            }),
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
                Get.toNamed(CartScreen.routName);
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

  Container addNewMenu() {
    @override
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController logoUrlController = TextEditingController();
    final TextEditingController categoryController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: priceController,
            decoration: const InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the price';
              }
              // You can add additional validation logic for price here
              return null;
            },
          ),
          TextFormField(
            controller: logoUrlController,
            decoration: const InputDecoration(labelText: 'Logo URL'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the logo URL';
              }
              // You can add URL format validation logic here
              return null;
            },
          ),
          TextFormField(
            controller: categoryController,
            decoration: const InputDecoration(labelText: 'Category'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the category';
              }
              return null;
            },
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () async {
              var newMenu = {
                "dishName": nameController.text,
                "dishPrice": int.parse(priceController.text),
                "dishCategory": categoryController.text,
                "imgUrl": logoUrlController.text,
              };
              await ApiService()
                  .addMenu(restaurantId: restaurant.id, newMenu: newMenu);
              nameController.clear();
              priceController.clear();
              logoUrlController.clear();
              categoryController.clear();
            },
            child: const Text('Add Food Item'),
          ),
        ],
      ),
    );
  }
}
