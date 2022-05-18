import 'package:flutter/material.dart';
import 'package:resto_hoel_book/constants/colors.dart';
import 'package:resto_hoel_book/models/restaurant.dart';
import 'package:resto_hoel_book/models/restaurantt.dart';
import 'package:resto_hoel_book/size_config.dart';

class RestaurantInfo extends StatelessWidget {
  final restaurnat = Restaurant.generateRestaurant();
  final Restaurantt restaurantt;
  RestaurantInfo({Key? key, required this.restaurantt}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getProportionateScreenHeight(40)),
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurantt.name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          restaurantt.waitTime,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Text(
                      //   restaurantt.distance,
                      //   style: TextStyle(
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.grey.withOpacity(0.4),
                      //   ),
                      // ),
                      // const SizedBox(width: 10),
                      SizedBox(
                        width: getProportionateScreenWidth(150),
                        child: Text(
                          restaurantt.label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(getProportionateScreenWidth(10)),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(
                    restaurantt.logoUrl,
                    fit: BoxFit.fill,
                    width: getProportionateScreenWidth(80),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '"${restaurantt.desc}"',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    color: kPrimaryColor,
                  ),
                  Text(
                    '${restaurantt.score}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
