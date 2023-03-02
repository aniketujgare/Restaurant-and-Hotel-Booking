import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/restaurantt.dart';
import '../../../size_config.dart';
import 'food_menu.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurantt restaurant;
  const RestaurantCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Restaurantt rest = Restaurantt(
    //     restaurant['name'],
    //     restaurant['waitTime'],
    //     restaurant['distance'],
    //     restaurant['label'],
    //     restaurant['logoUrl'],
    //     restaurant['desc'],
    //     4.8,
    //     restaurant['menu']);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
        splashColor: Colors.yellowAccent.withAlpha(30),
        onTap: () {
          Get.toNamed(FoodMenu.routName, arguments: restaurant);
          // restaurant["menu"].keys.forEach((key) {
          //   print(key);
          // });
          // Navigator.of(context, rootNavigator: true)
          //     .pushNamed(FoodMenu.routName);
          // Navigator.pushNamed(context, FoodMenu.routName);
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const FoodMenu()));
        },
        child: SizedBox(
          width: double.infinity,
          height: getProportionateScreenHeight(300),
          child: Column(
            children: [
              Container(
                height: getProportionateScreenHeight(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(getProportionateScreenWidth(15)),
                        topRight:
                            Radius.circular(getProportionateScreenWidth(15)))),
                child: const Center(
                  child: Text(
                    'PURE VEG RESTAURANT',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Image.network(
                restaurant.logoUrl,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                        color: Colors.amber,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      restaurant.name,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
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
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(6)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      restaurant.desc,
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    Text(
                      "₹${250} for one",
                      style:
                          TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
