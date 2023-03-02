import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../models/food.dart';
import '../../../size_config.dart';

import 'food_quantity.dart';

class FoodDetail extends StatelessWidget {
  final Food food;
  const FoodDetail({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(25)),
      color: kBackground,
      child: Column(
        children: [
          Text(
            food.name,
            style: const TextStyle(fontSize: 27),
          ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     _buildIconText(
          //       Icons.access_time_outlined,
          //       Colors.blue,
          //       food.waitTime,
          //     ),
          //     _buildIconText(
          //       Icons.star_outline,
          //       Colors.amber,
          //       food.score.toString(),
          //     ),
          //     _buildIconText(
          //       Icons.local_fire_department_outlined,
          //       Colors.red,
          //       food.cal,
          //     ),
          //   ],
          // ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FoodQuantity(
            food: food,
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: const [
              Text(
                'Ingredients',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          //TODO: ingredients
          // SizedBox(
          //   height: getProportionateScreenHeight(100),
          //   child: ListView.separated(
          //       shrinkWrap: true,
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (context, index) => Container(
          //             padding: EdgeInsets.all(
          //               getProportionateScreenWidth(10),
          //             ),
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(
          //                 getProportionateScreenWidth(40),
          //               ),
          //             ),
          //             child: Column(
          //               children: [
          //                 Image.asset(
          //                   food.ingredients[index].values.first,
          //                   width: getProportionateScreenWidth(52),
          //                 ),
          //                 Text(food.ingredients[index].keys.first)
          //               ],
          //             ),
          //           ),
          //       separatorBuilder: (_, index) => const SizedBox(width: 15),
          //       itemCount: food.ingredients.length),
          // ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: const [
              Text(
                'About',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          // Text(
          //   food.about,
          //   style: const TextStyle(
          //     wordSpacing: 1.2,
          //     height: 1.5,
          //     fontSize: 16,
          //   ),
          // ),
        ],
      ),
    );
  }
}
