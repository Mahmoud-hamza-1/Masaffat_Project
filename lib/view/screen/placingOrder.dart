import 'package:ecommerce_application/view/screen/Updateprofile.dart';
import 'package:ecommerce_application/view/screen/profile.dart';
import 'package:ecommerce_application/view/widget/home/customProfileMenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_to/swipe_to.dart';
//import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Placingorder extends StatelessWidget {
  const Placingorder({Key? key}) : super(key: key);

  static String AreaName = "AL-Hamra";
  static String ParkingName = "Alsibky Park ";
  static double pricePerHour = 5000;
  static String checkIntime = "Aug 12, 2024 3:15 AM";
  static String checkOuttime = "Aug 12, 2024 8:15 AM";
  static int Hours = 5;
  static double totalPrice = pricePerHour * Hours;
  static double taxes = 250;
  static double total = taxes + totalPrice;

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              size: 30,
            )),
        title: Text(
          "Checkout",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 18),
              child: Text(
                "$AreaName",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 18),
              child: Row(
                children: [
                  Text(
                    "$ParkingName",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Text(
                    "$pricePerHour",
                    style: TextStyle(fontSize: 15),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.cancel_outlined,
                        size: 15,
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Check-In : $checkIntime",
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Check-Out : $checkOuttime",
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    "Taxes and Fees",
                    style: TextStyle(fontSize: 13),
                  ),
                  SizedBox(width: 180),
                  Text(
                    "$taxes",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 14),
              child: Text(
                """
Hey!
Have you checked the monthly plans you can
subscribe to ?
            """,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("save more than 50.000sp per month")),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("to know more..."),
                ),
                SizedBox(
                  width: 110,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "View Plan Details",
                      style: TextStyle(color: Colors.cyan),
                    ))
              ],
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  Text("$totalPrice" + "sp"),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    "Total Taxes",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 190,
                  ),
                  Text("$taxes" + "sp"),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  Text(
                    "$total" + "sp",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(35),
              onTap: () {},
              child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text("Add Payment Method"),
                      SizedBox(
                        width: 180,
                      ),
                      Icon(Icons.chevron_right_rounded)
                    ],
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SwipeTo(
                  iconColor: Colors.red,
                  // swipeSensitivity: 20,
                  // onLeftSwipe: (details) {
                  //   print("ggggg");
                  // },
                  onRightSwipe: (details) {
                    Get.to(ProfileScreen());
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                //  left: BorderSide(width: 8.0, color: Colors.red),
                                )),

                        // BoxDecoration(borderRadius: BorderRadius.circular(30)),
                        // color: Colors.cyan,

                        child: Row(
                          children: [
                            Icon(
                              Icons.keyboard_double_arrow_right_outlined,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Text(
                              "Swipe To Place Order",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
