import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:resto_hoel_book/size_config.dart';

import '../../components/custom_app_bar.dart';

class HotelDetails extends StatelessWidget {
  HotelDetails({Key? key}) : super(key: key);
  static String routName = '/hotel_details';

  final List<String> images = [
    "https://cf.bstatic.com/xdata/images/hotel/max1024x768/336859645.jpg?k=36173da8bcedb9f207316b63f4c41e9b8210d15b1fdef598fa583fe8691e0567&o=&hp=1",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXHPs2hAOQ46B1bg2DiKqVjaV6efSIJSmhaA&usqp=CAU",
    "https://d1ha4q9jvugw4k.cloudfront.net/public_media/hotel_images/Delhi/hotel-new-city-lite/1.jpg",
    "https://pix10.agoda.net/hotelImages/256/256343/256343_20010216190086611344.jpg?ca=9&ce=1&s=1024x768",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      pageSnapping: true,
                      viewportFraction: 1.03,
                      height: getProportionateScreenHeight(350),
                      enableInfiniteScroll: false,
                      autoPlay: true,
                    ),
                    items: images.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(5)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      getProportionateScreenWidth(20)),
                                  bottomRight: Radius.circular(
                                      getProportionateScreenWidth(20))),
                              child: Image(
                                image: NetworkImage(i),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Positioned(
                    top: getProportionateScreenHeight(15),
                    width: SizeConfig.screenWidth,
                    child: CustomAppBar(
                      leftIcon: CupertinoIcons.back,
                      rightIcon: CupertinoIcons.heart,
                      leftCallBack: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              nameAndDescription(),
              SizedBox(height: getProportionateScreenHeight(5)),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(14)),
                height: 1,
                color: Colors.grey.shade300,
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(14),
                    vertical: getProportionateScreenHeight(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Facilities",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(15)),
                    GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: getProportionateScreenWidth(30),
                      mainAxisSpacing: getProportionateScreenHeight(15),
                      shrinkWrap: true,
                      children: const [
                        FacilitiesSquare(
                            icon: Icons.wifi_outlined, name: 'WiFi'),
                        FacilitiesSquare(icon: Icons.bed_outlined, name: 'Bed'),
                        FacilitiesSquare(icon: Icons.air_outlined, name: 'AC'),
                        FacilitiesSquare(icon: Icons.hot_tub, name: 'Tub'),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: const [
                    //     FacilitiesSquare(
                    //         icon: Icons.wifi_outlined, name: 'WiFi'),
                    //     // SizedBox(width: 10),
                    //     FacilitiesSquare(icon: Icons.bed_outlined, name: 'Bed'),
                    //     // SizedBox(width: 10),
                    //     FacilitiesSquare(icon: Icons.air_outlined, name: 'AC'),
                    //     // SizedBox(width: 10),
                    //     FacilitiesSquare(icon: Icons.hot_tub, name: 'Tub'),
                    //   ],
                    // ),
                    SizedBox(height: getProportionateScreenHeight(25)),
                    const Text(
                      "Select date & guests",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(5)),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(14)),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.8),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(3),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(14),
                    vertical: getProportionateScreenHeight(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(
                      Icons.calendar_month_sharp,
                      color: Colors.white,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Today - Tomorrow",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "12:00 PM - 11:00 AM",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "1 Room",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "1 Guest",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(25)),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(25),
                      vertical: getProportionateScreenHeight(15)),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(
                      Radius.circular(getProportionateScreenWidth(15)),
                    ),
                  ),
                  child: const Text(
                    "Book Now",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(25)),
            ],
          ),
        ),
      ),
    );
  }

  Container nameAndDescription() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(14),
          vertical: getProportionateScreenHeight(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Royal Ruby Hotel",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(5)),
          const Text(
            "Hulimangala main road Electronic city phase 1 Delhi, 560211, Delhi",
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}

class FacilitiesSquare extends StatelessWidget {
  final IconData icon;
  final String name;
  const FacilitiesSquare({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(55),
      width: getProportionateScreenHeight(55),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(getProportionateScreenWidth(12)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(
              0.0,
              1.0,
            ),
            blurRadius: 1.5,
            spreadRadius: 1,
          ), //BoxShadow
          const BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          Text(
            name,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
