import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_hoel_book/components/custom_app_bar.dart';
import 'package:resto_hoel_book/constants/colors.dart';
import 'package:resto_hoel_book/models/cart_controller.dart';
import 'package:resto_hoel_book/models/menu_model.dart';
import 'package:resto_hoel_book/screens/detail/widget/food_detail.dart';
import 'package:resto_hoel_book/screens/detail/widget/food_image.dart';
import 'package:resto_hoel_book/size_config.dart';

class FoodDetailPage extends StatelessWidget {
  final cartController = Get.put(CartController());
  final Menu food;
  FoodDetailPage({Key? key, required this.food}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              leftIcon: CupertinoIcons.back,
              rightIcon: CupertinoIcons.heart,
              leftCallBack: () => Navigator.of(context).pop(),
            ),
            FoodImg(food: food),
            FoodDetail(food: food),
            Container(
              color: kBackground,
              height: getProportionateScreenHeight(50),
            )
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: getProportionateScreenWidth(100),
        height: getProportionateScreenHeight(56),
        child: RawMaterialButton(
          fillColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(50),
            ),
          ),
          onPressed: null,
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
    );
  }
}
