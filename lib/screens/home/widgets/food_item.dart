import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_hoel_book/constants/colors.dart';
import 'package:resto_hoel_book/models/cart_controller.dart';
import 'package:resto_hoel_book/models/menu_model.dart';
import '../../../size_config.dart';

class FoodItem extends StatefulWidget {
  final Menu food;
  const FoodItem(this.food, {Key? key}) : super(key: key);

  @override
  State<FoodItem> createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 110,
              height: 110,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(getProportionateScreenWidth(12.0)),
                child: Image.network(
                  widget.food.imgUrl,
                  fit: BoxFit.fitHeight,
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
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.food.name,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 5),
                    // Text(
                    //   widget.food.desc,
                    //   // 'khbh',
                    //   overflow: TextOverflow.fade,
                    //   softWrap: false,
                    //   style: TextStyle(
                    //     color: widget.food.hightLight
                    //         ? kPrimaryColor
                    //         : Colors.grey.withOpacity(0.8),
                    //     // height: 1.5,
                    //   ),
                    // ),
                    // const SizedBox(height: 5),
                    Row(
                      children: [
                        const Text(
                          '₹',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.food.price}',
                          // '400',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        if (cartController.isAdded(
                            widget.food)) // if added then show + - buttns
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Material(
                                type: MaterialType.transparency,
                                child: IconButton(
                                  splashRadius: 15,
                                  highlightColor:
                                      Colors.amberAccent.withOpacity(0.3),
                                  color: Colors.amber,
                                  onPressed: () {
                                    cartController.removeFood(widget.food);
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(
                                    getProportionateScreenWidth(12)),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kBackground,
                                ),
                                child: Obx(
                                  () => Text(
                                    cartController
                                        .foodQuantity(widget.food)
                                        .toString(),
                                    // cartController.getQuantity.toString(),
                                    // food.quantity.toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                type: MaterialType.transparency,
                                child: IconButton(
                                  splashRadius: 15,
                                  highlightColor:
                                      Colors.amberAccent.withOpacity(0.3),
                                  color: Colors.amber,
                                  onPressed: () {
                                    cartController.addFood(widget.food);
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        if (!cartController.isAdded(widget.food))
                          TextButton(
                              child: const Text(
                                'Add To Cart',
                                style: TextStyle(
                                  color: Colors.amber,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  cartController.addFood(widget.food);
                                });
                              }),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
