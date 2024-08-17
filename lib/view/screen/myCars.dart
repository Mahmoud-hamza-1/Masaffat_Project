import 'package:ecommerce_application/view/screen/Updateprofile.dart';
import 'package:ecommerce_application/view/screen/profile.dart';
import 'package:ecommerce_application/view/widget/home/customProfileMenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_to/swipe_to.dart';

import 'package:http/http.dart ' as http;
//import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Mycars extends StatelessWidget {
  const Mycars({Key? key}) : super(key: key);

  static String AreaName = "AL-Hamra";
  static String ParkingName = "Alsibky Park ";
  static double pricePerHour = 5000;
  static String checkIntime = "Aug 12, 2024 3:15 AM";
  static String checkOuttime = "Aug 12, 2024 8:15 AM";
  static int Hours = 5;
  static double totalPrice = pricePerHour * Hours;
  static double taxes = 250;
  static double total = taxes + totalPrice;

  static List<String> myCars = List<String>.generate(150, (i) => 'car $i');

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        appBar: AppBar(
          title: Text("My Cars"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
        ),
        body: ListView.builder(
            itemCount: myCars.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.car_crash_sharp,
                      size: 28,
                    ),
                    Text(
                      "car Number",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(myCars[index]),
                    SizedBox(
                      width: 150,
                    ),
                  ],
                ),
              );
            }));
  }
}
