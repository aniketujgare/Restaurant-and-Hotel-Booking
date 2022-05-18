import 'package:flutter/material.dart';

import '../../components/custom_bottom_nav_bar.dart';
import '../../size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
