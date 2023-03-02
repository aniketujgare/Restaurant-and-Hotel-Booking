import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_hoel_book/components/custom_app_bar.dart';
import 'package:resto_hoel_book/models/cart_controller.dart';
import '../../../size_config.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);
  static String routName = '/payment_screen';

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final cartController = Get.put(CartController());

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // print(_keys[0]);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 60),
          child: CustomAppBar(
              leftIcon: Icons.arrow_back_ios,
              rightIcon: CupertinoIcons.heart,
              leftCallBack: () => Get.back()),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(14),
                vertical: getProportionateScreenHeight(20),
              ),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(14),
                      vertical: getProportionateScreenHeight(20),
                    ),
                    child: const Text("Payment Page")),
              ),
            ),
          ]),
        ));
  }
}
