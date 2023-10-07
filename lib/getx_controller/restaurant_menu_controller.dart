import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../api/api.dart';
import '../models/menu_model.dart';

class RestaurantMenuController extends GetxController
    with StateMixin<MenuModel> {
  var selectedCategoryIndex = 0.obs;
  var isLoading = true.obs;
  var foodMenu = <String, List<Menu>>{}.obs;
  // Map<String, List<Menu>> menu = {}; //{category:foodItem}
  getRestMenu({required String restId}) async {
    try {
      if (foodMenu.isEmpty) {
        debugPrint('Fetching Restaurant Menu');
        var _foodMenu = await ApiService().getMenu(restaurantId: restId);
        if (_foodMenu != null) {
          for (var element in _foodMenu.menu) {
            Map<String, dynamic> e = {element.category: Menu};
            if (foodMenu.containsKey(element.category)) {
              foodMenu[element.category]!.add(element);
            } else {
              foodMenu[element.category] = [element];
            }
          }
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
