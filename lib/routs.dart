import 'package:flutter/widgets.dart';
import 'package:resto_hoel_book/screens/foodScreen/widgets/food_menu.dart';
import 'package:resto_hoel_book/screens/home/home.dart';
import 'package:resto_hoel_book/screens/hotel%20screen/hotel_detail.dart';
import 'package:resto_hoel_book/screens/hotel%20screen/hotel_screen_page.dart';

// Using name route, all our routes will be available here

final Map<String, WidgetBuilder> routes = {
  HomePage.routName: (context) => const HomePage(),
  HotelScreenPage.routName: (context) => const HotelScreenPage(),
  FoodMenu.routName: (context) => const FoodMenu(),
  HotelDetails.routName: (context) => HotelDetails(),
};
