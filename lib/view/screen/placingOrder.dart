import 'dart:convert';

import 'package:ecommerce_application/view/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_to/swipe_to.dart';

import 'package:http/http.dart ' as http;

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
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: const Icon(
        //       Icons.chevron_left,
        //       size: 30,
        //     )),
        title: const Text(
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
            const Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 18),
              child: Text(
                "$AreaName",
                style: const TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 18),
              child: Row(
                children: [
                  Text(
                    "$ParkingName",
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  Text(
                    "$pricePerHour",
                    style: const TextStyle(fontSize: 15),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.cancel_outlined,
                        size: 15,
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Check-In : $checkIntime",
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Check-Out : $checkOuttime",
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  const Text(
                    "Taxes and Fees",
                    style: TextStyle(fontSize: 13),
                  ),
                  const SizedBox(width: 180),
                  Text(
                    "$taxes",
                    style: const TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 15,
            ),
            const Padding(
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
            const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("save more than 50.000sp per month")),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("to know more..."),
                ),
                const SizedBox(
                  width: 110,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View Plan Details",
                      style: TextStyle(color: Colors.cyan),
                    ))
              ],
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  const Text(
                    "Subtotal",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    width: 200,
                  ),
                  Text("$totalPrice" + "sp"),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  const Text(
                    "Total Taxes",
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(
                    width: 190,
                  ),
                  Text("$taxes" + "sp"),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 200,
                  ),
                  Text(
                    "$total" + "sp",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(35),
              onTap: () {},
              child: const Padding(
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
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
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
                  onRightSwipe: (details) async {
                    print("start from here");
                    String url = "http://10.0.2.2:8000/api/addBooking/2/25";

                    var response = await http
                        .post(Uri.parse(url), headers: <String, String>{
                      'Accept': 'application/json',
                    }, body: {
                      'from': '7:22',
                      'to': '9:33',
                      'user_id': '1'
                    });

                    print("hello from this line");
                    print(response.body);

                    if (response.statusCode == 200 ||
                        response.statusCode == 201) {
                      print("popopop");
                      print(response.body);
                      print(response);
                      print('ERROR 5');
                      Map responseBody = jsonDecode(response.body);
                      print('ERROR 6');
                      print(responseBody);
                      Get.to(const HomePage());
                      // return Right(responseBody);
                    } else {
                      Get.defaultDialog(
                        title: 'serverFailure',
                        middleText: 'incorrect Password or Email',
                      );
                      Get.to(const HomePage());
                      //return const Left(StatusRequest.serverFailure);
                    }

//http.StreamedResponse response = await request.send();

// if (response.statusCode == 200|| response.statusCode == 201) {
//   print("allll doneeee");
// }
// else {
//   print("faileeeed");
//   print(response.reasonPhrase);
// }

                    //  Get.to(ProfileScreen());
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            border: Border(
                                //  left: BorderSide(width: 8.0, color: Colors.red),
                                )),

                        // BoxDecoration(borderRadius: BorderRadius.circular(30)),
                        // color: Colors.cyan,

                        child: const Row(
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
