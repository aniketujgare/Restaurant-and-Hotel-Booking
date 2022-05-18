import 'package:flutter/material.dart';
import 'package:resto_hoel_book/constants/colors.dart';
import 'package:resto_hoel_book/models/food.dart';
import 'package:resto_hoel_book/size_config.dart';

class FoodImg extends StatelessWidget {
  final Food food;
  const FoodImg({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(250),
      child: Stack(children: [
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: kBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(getProportionateScreenWidth(50)),
                    topRight: Radius.circular(
                      getProportionateScreenWidth(50),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: getProportionateScreenWidth(250),
            height: getProportionateScreenWidth(250),
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(-1, 10),
                blurRadius: 10,
              )
            ]),
            margin: EdgeInsets.all(getProportionateScreenWidth(15)),
            child: Image.network(
              food.imgUrl,
              fit: BoxFit.contain,
            ),
          ),
        )
      ]),
    );
  }
}
