import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_hoel_book/models/restaurant_model.dart';
import 'food_menu.dart';

import '../../../size_config.dart';

class RestaurantCardSwi extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCardSwi({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
        splashColor: Colors.yellowAccent.withAlpha(30),
        onTap: () {
          Get.toNamed(FoodMenu.routName, arguments: restaurant);
        },
        child: SizedBox(
          width: double.infinity,
          height: getProportionateScreenHeight(165),
          child: Row(
            children: [
              Material(
                elevation: 20,
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(getProportionateScreenWidth(15)),
                    child: Image.network(
                      restaurant.logoUrl,
                      width: 125,
                      height: double.maxFinite,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                            color: Colors.amber,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(width: getProportionateScreenHeight(10)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenWidth(4)),
                        ),
                        child: Text(
                          " ${restaurant.score} ★ ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: getProportionateScreenHeight(10)),
                      Text(
                        '35-45 min',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.5,
                    child: Text(
                      restaurant.tagLine,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Text(
                    "₹${250} for one",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
