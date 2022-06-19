import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_hoel_book/components/custom_app_bar.dart';
import 'package:resto_hoel_book/models/cart_controller.dart';
import 'package:resto_hoel_book/screens/detail/widget/dash_line.dart';
import '../../../constants/colors.dart';
import '../../../size_config.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static String routName = '/cart_screen';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    var _cartList = cartController.getCartList;
    var _keys = cartController.getCartList.keys.toList();
    // print(_cartList[_keys[0]].toString());
    num cartTotal = 0;
    // // print(foodList);
    for (var i = 0; i < _keys.length; i++) {
      // print(_cartList[_keys[i]]);
      cartTotal += _keys[i].price *
          num.tryParse(cartController.foodQuantity(_keys[i]).toString());
      // int.parse(_keys[i].price) * cartController.foodQuantity(_keys[i]);
    }
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Wrap(
              children: [
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _keys.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text(
                                _keys[index].name,
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(13)),
                              ),
                              trailing: SizedBox(
                                width: getProportionateScreenWidth(140),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Material(
                                      type: MaterialType.transparency,
                                      child: IconButton(
                                        splashRadius: 15,
                                        highlightColor:
                                            Colors.amberAccent.withOpacity(0.3),
                                        color: Colors.amber,
                                        onPressed: () {
                                          cartController
                                              .removeFood(_keys[index]);
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          size: getProportionateScreenWidth(18),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // padding: EdgeInsets.all(
                                      //     getProportionateScreenWidth(15)),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kBackground,
                                      ),
                                      child: Obx(
                                        () => Text(
                                          cartController
                                              .foodQuantity(_keys[index])
                                              .toString(),
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(15),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Material(
                                      type: MaterialType.transparency,
                                      child: IconButton(
                                        splashRadius: 15,
                                        highlightColor:
                                            Colors.amberAccent.withOpacity(0.3),
                                        color: Colors.amber,
                                        onPressed: () {
                                          cartController.addFood(_keys[index]);
                                          setState(() {});
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: getProportionateScreenWidth(18),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: SizeConfig.screenWidth! * 0.08,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text(
                                          '₹${_keys[index].price * cartController.foodQuantity(_keys[index])}',
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ),
                                    ),
                                    // FittedBox(
                                    //   fit: BoxFit.scaleDown,
                                    //   child: Text(
                                    //       '₹${_keys[index].price * cartController.foodQuantity(_keys[index])}',
                                    //       style: TextStyle(
                                    //         fontSize:
                                    //             getProportionateScreenWidth(15),
                                    //         fontWeight: FontWeight.bold,
                                    //       )),
                                    // )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(28),
              ),
              child: const Text('Bill Details'),
            ),
            Wrap(
              children: [
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
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenHeight(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Item Total'),
                              Text('₹$cartTotal')
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Delivery Charge'),
                              Text('₹40'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('To Pay'),
                              Text(
                                '₹${cartTotal + 40}',
                                style: const TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.21,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: SizeConfig.screenHeight! * 0.21,
        width: double.maxFinite,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              color: kBackground,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 15.0,
                ),
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Delivery Address",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.home,
                            color: Colors.amber,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_double_arrow_down_sharp,
                          color: Colors.amber,
                        ),
                      ],
                    )
                  ],
                ),
                DashLineView(
                    fillRate: 0.5, dashWith: 5, dashColor: Colors.grey),
                const SizedBox(height: 10),
                const Text(
                  'C/o Aniket Ujgare, Behind SRPF Camp Hingoli - 431513, Maharashtra',
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹${cartTotal + 40}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.6,
                      child: TextButton(
                          onPressed: null,
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: const Text(
                            'Proceed to Pay',
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
