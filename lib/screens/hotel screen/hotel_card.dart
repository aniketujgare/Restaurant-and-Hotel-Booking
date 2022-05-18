import 'package:flutter/material.dart';
import 'package:resto_hoel_book/screens/hotel%20screen/hotel_detail.dart';
import 'package:resto_hoel_book/size_config.dart';

class HotelCard extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final int price;
  const HotelCard({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(14)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
        splashColor: Colors.purpleAccent.withAlpha(30),
        onTap: () {
          Navigator.of(context, rootNavigator: true)
              .pushNamed(HotelDetails.routName);
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => HotelDetails()));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image(
                height: getProportionateScreenHeight(180),
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(getProportionateScreenWidth(15)),
                  topRight: Radius.circular(getProportionateScreenWidth(15))),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    height: getProportionateScreenHeight(30),
                    child: const Center(
                      child: Text(
                        " ${3.6} ★ ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius:
                          BorderRadius.circular(getProportionateScreenWidth(6)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(6)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  Container(
                    height: getProportionateScreenHeight(40),
                    width: getProportionateScreenWidth(100),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(10)),
                    ),
                    child: Center(
                      child: Text(
                        "  ₹$price  ",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(8)),
          ],
        ),
      ),
    );
  }
}
