import 'package:flutter/widgets.dart';
import 'package:resto_hoel_book/screens/detail/widget/cart_screen.dart';
import 'package:resto_hoel_book/screens/detail/widget/delivery_details.dart';
import 'package:resto_hoel_book/screens/detail/widget/payment_page.dart';
import 'package:resto_hoel_book/screens/foodScreen/widgets/food_menu.dart';
import 'package:resto_hoel_book/screens/home/home.dart';
import 'package:resto_hoel_book/screens/hotel%20screen/hotel_detail.dart';
import 'package:resto_hoel_book/screens/hotel%20screen/hotel_screen_page.dart';
import 'package:resto_hoel_book/screens/signup%20screen/signup.dart';

// Using name route, all our routes will be available here

final Map<String, WidgetBuilder> routes = {
  HomePage.routName: (context) => const HomePage(),
  HotelScreenPage.routName: (context) => const HotelScreenPage(),
  FoodMenu.routName: (context) => const FoodMenu(),
  HotelDetails.routName: (context) => HotelDetails(),
  CartScreen.routName: (context) => const CartScreen(),
  DeliveryDetails.routName: (context) => const DeliveryDetails(),
  PaymentPage.routName: (context) => const PaymentPage(),
  SignupScreen.routName: (context) => SignupScreen(),
};
