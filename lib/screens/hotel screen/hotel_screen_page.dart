import 'package:flutter/material.dart';
import 'package:resto_hoel_book/components/hotel_screen_app_bar.dart';
import 'package:resto_hoel_book/screens/hotel%20screen/hotel_card.dart';
import 'package:resto_hoel_book/size_config.dart';

class HotelScreenPage extends StatelessWidget {
  const HotelScreenPage({Key? key}) : super(key: key);
  static String routName = '/hotel_screen_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HotelScreenAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(14)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(14)),
                child: const Text(
                  'Hotels around you',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(14)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(2)),
                child: const HotelCard(
                  name: 'Hotel Breeze',
                  description: 'Delhi, India',
                  image: 'assets/images/hotel1.jpg',
                  price: 799,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(14)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(2)),
                child: const HotelCard(
                  name: 'Hotel Cozy Cave',
                  description: 'Delhi, Delhi Airport',
                  image: 'assets/images/hotel3.jpg',
                  price: 1299,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
