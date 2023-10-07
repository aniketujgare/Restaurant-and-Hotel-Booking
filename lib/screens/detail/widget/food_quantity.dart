import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_hoel_book/constants/colors.dart';
import 'package:resto_hoel_book/models/cart_controller.dart';
import 'package:resto_hoel_book/models/menu_model.dart';
import 'package:resto_hoel_book/size_config.dart';

class FoodQuantity extends StatelessWidget {
  final cartController = Get.put(CartController());
  final Menu food;
  FoodQuantity({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: getProportionateScreenHeight(40),
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(-0.2, 0),
            child: Container(
              width: getProportionateScreenWidth(200),
              height: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenWidth(30))),
              child: Row(
                children: [
                  const SizedBox(width: 15),
                  const Text(
                    '₹',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    food.price.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0.3, 0),
            child: Container(
              height: double.maxFinite,
              width: getProportionateScreenWidth(120),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenWidth(30))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 30,
                    child: TextButton(
                      onPressed: () {
                        cartController.removeFood(food);
                      },
                      child: const Text(
                        '-',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Obx(
                      () => Text(
                        cartController.foodQuantity(food).toString(),
                        // cartController.getQuantity.toString(),
                        // food.quantity.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: TextButton(
                      onPressed: () {
                        cartController.addFood(food);
                      },
                      child: const Text(
                        '+',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
