import 'package:get/get.dart';
import 'package:resto_hoel_book/models/food.dart';

class CartController extends GetxController {
  var _cartList = {}.obs;
  var _totalFoodItems = 1.obs;

  void addFood(Food food) {
    // print("added");
    if (_cartList.containsKey(food)) {
      _cartList[food] += 1;
    } else {
      _cartList[food] = 1;
    }
  }

  void removeFood(Food food) {
    // print("removed");
    if (_cartList.containsKey(food)) {
      if (_cartList[food] > 0) {
        _cartList[food] -= 1;
      }
    } else {
      // _cartList.remove(food);
      _cartList[food] = 0;
    }
    for (var i = 0; i < _cartList.keys.length; i++) {
      if (_cartList[food] == 0) {
        _cartList.remove(food);
      }
    }
  }

  int foodQuantity(Food food) {
    return _cartList[food] ?? 0;
  }

  bool isAdded(Food food) {
    return (_cartList.containsKey(food) && _cartList[food] > 0);
  }

  get cartQuantity {
    num size = 0;
    var keys = _cartList.keys.toList();

    for (var k in keys) {
      size += _cartList[k];
    }
    return size;
  }

  get getCartList => _cartList;
}
