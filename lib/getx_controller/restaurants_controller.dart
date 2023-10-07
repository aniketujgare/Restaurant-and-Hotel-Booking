import 'package:get/get.dart';
import 'package:resto_hoel_book/api/api.dart';
import 'package:resto_hoel_book/models/restaurant_model.dart';

import '../models/menu_model.dart';

class RestaurantController extends GetxController
    with StateMixin<RestaurnatsState> {
  @override
  void onInit() {
    super.onInit();
    ApiService().getRestaurants().then((restaurants) {
      change(RestaurantsModelLoaded(restaurnatModel: restaurants!),
          status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}

abstract class RestaurnatsState {}

class MenuModelLoaded extends RestaurnatsState {
  final MenuModel menuModel;

  MenuModelLoaded({required this.menuModel});
}

class RestaurantsModelLoaded extends RestaurnatsState {
  final RestaurnatModel restaurnatModel;

  RestaurantsModelLoaded({required this.restaurnatModel});
}
