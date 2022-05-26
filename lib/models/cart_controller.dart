import 'package:get/get.dart';
import 'package:resto_hoel_book/models/food.dart';

class CartController extends GetxController {
  var _cartList = {}.obs;
  var _totalFoodItems = 1.obs;

  void addFood(Food food) {
    // print("added");
    if (_cartList.containsKey(food.name)) {
      _cartList[food.name] += 1;
    } else {
      _cartList[food.name] = 1;
    }
  }

  void removeFood(Food food) {
    // print("removed");
    if (_cartList.containsKey(food.name)) {
      if (_cartList[food.name] > 0) {
        _cartList[food.name] -= 1;
      }
    } else {
      _cartList[food.name] = 0;
    }
  }

  int foodQuantity(Food food) {
    return _cartList[food.name] ?? 0;
  }

  bool isAdded(Food food) {
    return (_cartList.containsKey(food.name) && _cartList[food.name] > 0);
  }

  get cartQuantity {
    num size = 0;
    var keys = _cartList.keys.toList();

    for (var k in keys) {
      size += _cartList[k];
    }
    return size;
  }
  // get cartQ
}
