import 'package:ecommerce_application/controller/map/car_controller.dart';
import 'package:ecommerce_application/view/screen/Updateprofile.dart';
import 'package:ecommerce_application/view/screen/profile.dart';
import 'package:ecommerce_application/view/widget/home/customProfileMenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_to/swipe_to.dart';

import 'package:http/http.dart ' as http;

import '../../controller/myCarController.dart';
import 'addingCar.dart';
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

    //MyCarsControllerImp controller = Get.put(MyCarsControllerImp());

    return Scaffold(
        appBar: AppBar(
          title: const Text("My Cars"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const Addingcar());
                },
                icon: const Icon(Icons.add)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   width: double.infinity,
              //   height: 150,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       Container(
              //         margin: const EdgeInsets.all(15),
              //         width: 319,
              //         height: 100,
              //         color: Colors.green,
              //         alignment: Alignment.center,
              //         child: const Text(
              //           '\$5200.00',
              //           style: TextStyle(
              //               fontSize: 15,
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //       Container(
              //         margin: const EdgeInsets.all(15),
              //         width: 319,
              //         height: 100,
              //         color: Colors.green,
              //         alignment: Alignment.center,
              //         child: const Text(
              //           '\$1200.00',
              //           style: TextStyle(
              //               fontSize: 15,
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //       const SizedBox(height: 24),
              //     ],
              //   ),
              // ),
              // const Padding(
              //   padding: EdgeInsets.all(15),
              //   child: Text(
              //     "Recent Transactions",
              //     style: TextStyle(
              //         fontSize: 14,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.green),
              //   ),
              // ),
              GetBuilder<CarControllerImp>(
                  init: CarControllerImp(),
                  builder: (controller) {
                    return controller.cars == null || controller.cars!.isEmpty
                        ? const Center(
                            child: Text('you dont have a car'),
                          )
                        : Center(
                            child:
                                //FutureBuilder<List<MyCarsControllerImp>>(
                                //future: controller.getMyCars(),
                                //builder: (context, snapshot) {
                                //if (snapshot.hasData) {
                                //return
                                ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.cars?.length,
                              // snapshot.data!.length,
                              itemBuilder: (context, index) {
                                var car = controller.cars![index];
                                return ListTile(
                                  leading:

                                      //  CircleAvatar(
                                      //   child:
                                      //   Image.asset('assets/images/Mercedes.jpg'),
                                      //   // Icon(Icons.car_rental_rounded)
                                      //   //  Image.network(
                                      //   //     snapshot.data![index].avatar.toString()),
                                      // ),

                                      ClipRRect(
                                    borderRadius: BorderRadius.circular(30.0),
                                    child: Image.asset(
                                      'assets/images/car.png',
                                      height: 100.0,
                                      width: 100.0,
                                    ),
                                  ),
                                  title: Text(car.description.toString()),
                                  // trailing: const Text("300E"),
                                  // subtitle: const Text("2024"),
                                );
                              },
                            ),
                          );
                  })
            ],
          ),
        ));
    //  } else if (snapshot.hasError) {
    //  return Text('${snapshot.error}');
    // }
    //return const CircularProgressIndicator();
  }
}
// ),

//  ListView.builder(
//     itemCount: myCars.length,
//     itemBuilder: (context, index) {
//       return Padding(
//         padding: const EdgeInsets.only(left: 15),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.car_crash_sharp,
//               size: 28,
//             ),
//             Text(
//               "car Number",
//               style: TextStyle(fontSize: 30),
//             ),
//             Text(myCars[index]),
//             SizedBox(
//               width: 150,
//             ),
//           ],
//         ),
//       );
//     })
