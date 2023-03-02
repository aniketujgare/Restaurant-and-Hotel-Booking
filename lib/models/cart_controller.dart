import 'package:get/get.dart';

import 'food.dart';

class CartController extends GetxController {
  var cartList = {}.obs;
  var totalFoodItems = 1.obs;

  void addFood(Food food) {
    // print("added");
    if (cartList.containsKey(food)) {
      cartList[food] += 1;
    } else {
      cartList[food] = 1;
    }
  }

  void removeFood(Food food) {
    // print("removed");
    if (cartList.containsKey(food)) {
      if (cartList[food] > 0) {
        cartList[food] -= 1;
      }
    } else {
      // cartList.remove(food);
      cartList[food] = 0;
    }
    for (var i = 0; i < cartList.keys.length; i++) {
      if (cartList[food] == 0) {
        cartList.remove(food);
      }
    }
  }

  int foodQuantity(Food food) {
    return cartList[food] ?? 0;
  }

  bool isAdded(Food food) {
    return (cartList.containsKey(food) && cartList[food] > 0);
  }

  get cartQuantity {
    num size = 0;
    var keys = cartList.keys.toList();

    for (var k in keys) {
      size += cartList[k];
    }
    return size;
  }

  get getCartList => cartList;
}
