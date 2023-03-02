import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto_hoel_book/components/custom_app_bar.dart';
import 'package:resto_hoel_book/models/cart_controller.dart';
import 'package:resto_hoel_book/screens/detail/widget/payment_page.dart';
import '../../../size_config.dart';

class DeliveryDetails extends StatefulWidget {
  const DeliveryDetails({Key? key}) : super(key: key);
  static String routName = '/delivery_details_screen';

  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Enter Delivery Details",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 10),
                        MyCustomForm(),
                      ],
                    )),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: getProportionateScreenWidth(28),
            //   ),
            //   child: const Text('Bill Details'),
            // ),
            // Wrap(
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.symmetric(
            //         horizontal: getProportionateScreenWidth(14),
            //         vertical: getProportionateScreenHeight(20),
            //       ),
            //       child: Card(
            //         elevation: 5,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(15),
            //         ),
            //         child: Padding(
            //           padding: EdgeInsets.symmetric(
            //             horizontal: getProportionateScreenWidth(20),
            //             vertical: getProportionateScreenHeight(20),
            //           ),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   const Text('Item Total'),
            //                   Text('₹cartTotal')
            //                 ],
            //               ),
            //               const SizedBox(height: 10),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: const [
            //                   Text('Delivery Charge'),
            //                   Text('₹40'),
            //                 ],
            //               ),
            //               const SizedBox(height: 10),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   const Text('To Pay'),
            //                   Text(
            //                     '₹{cartTotal + 40}',
            //                     style: const TextStyle(
            //                       color: Colors.deepOrange,
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: SizeConfig.screenHeight! * 0.21,
            // ),
          ],
        ),
      ),
      // bottomSheet: Container(
      //   height: SizeConfig.screenHeight! * 0.23,
      //   width: double.maxFinite,
      //   color: Colors.transparent,
      //   child: const Placeholder(
      //     color: Colors.orange,
      //   ),
      // ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            cursorColor: Colors.black,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.amber, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelStyle: const TextStyle(color: Colors.amber),
              border: const OutlineInputBorder(),
              labelText: 'Name',
            ),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            cursorColor: Colors.black,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter phone number';
              }
              return null;
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.amber, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelStyle: const TextStyle(color: Colors.amber),
              border: const OutlineInputBorder(),
              labelText: 'Phone',
            ),
          ),
          const SizedBox(height: 20.0),
          TextFormField(
            maxLines: 4,
            cursorColor: Colors.black,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter delivery address';
              }
              return null;
            },
            keyboardType: TextInputType.streetAddress,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.amber, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              labelStyle: const TextStyle(color: Colors.amber),
              border: const OutlineInputBorder(),
              labelText: 'Adress',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ElevatedButton(
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  // Get.snackbar("Order", " Processing Order");
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Order')),
                  );
                  Get.toNamed(PaymentPage.routName);
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
