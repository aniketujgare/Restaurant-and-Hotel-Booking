import 'package:flutter/material.dart';

class HotelScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HotelScreenAppBar({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        //TODO:Add Foodie App bar
        child: Material(
          elevation: 3,
          child: Container(
            height: 80,
            width: double.infinity,
            color: Colors.deepPurple,
            child: const Center(
                child: Text(
              "Hotels",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ));
  }
}
