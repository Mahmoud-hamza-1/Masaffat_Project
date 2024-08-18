import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application/controller/home/home_controller.dart';
import 'package:ecommerce_application/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_application/view/screen/map/parking_page.dart';
import 'package:ecommerce_application/view/screen/placingOrder.dart';
import 'package:ecommerce_application/view/widget/home/customhomeWidget.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'myCars.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: const Text(
            'Masaffat',
            style: TextStyle(fontFamily: "assets/fonts/Poppins-Black.ttf "),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  //here
                  Get.to(() => const Mycars());
                },
                icon: const Icon(Icons.car_rental)),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.local_parking_rounded,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Slider Section
              GetBuilder<HomeControllerImp>(
                  init: HomeControllerImp(),
                  builder: (controller) {
                    return controller.ads == []
                        ? const SizedBox.shrink()
                        : CarouselSlider(
                            options: CarouselOptions(
                              height: 200.0,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 4),
                              enlargeCenterPage: true,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.8,
                              scrollDirection: Axis.horizontal,
                            ),
                            items: controller.ads
                                .map((item) => InkWell(
                                      onTap: () async {
                                        await launchUrlString(
                                            item.imageUrl ?? '');
                                      },
                                      child: Image.network(
                                        '$baseUrl1/${item.imagePath}',
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Center(
                                          child: Text('$error'),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          );
                  }),
              const SizedBox(height: 16),
              // Icons Section
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("Choose Service"),
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Customhomewidget(
                      label: "Parking",
                      path: 'assets/icons/parking.png',
                      onPressed: () {
                        Get.to(const ParkingPage());
                      },
                    ),
                    Customhomewidget(
                      label: "Insurance",
                      path: 'assets/icons/car-insurance.png',
                      onPressed: () {},
                    ),
                    Customhomewidget(
                      label: "Car Wash",
                      path: 'assets/icons/exterior-cleaning.png',
                      onPressed: () {},
                    ),
                    Customhomewidget(
                      label: "EV",
                      path: 'assets/icons/charging-station.png',
                      onPressed: () {},
                    ),
                    Customhomewidget(
                      label: "Gas",
                      path: 'assets/icons/gas.png',
                      onPressed: () {},
                    ),
                    Customhomewidget(
                      label: "Auto Finance",
                      path: 'assets/icons/car.png',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 16),
              // Middle Banner Section
              Container(
                padding: const EdgeInsets.all(16.0),
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pay Less for Car Expenses',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Choose Service'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Compare Price'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Get Cashback'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Map Section
              Container(
                height: 300,
                color: Colors.grey[300],
                child: Container(
                  child: Image.asset('assets/images/map.png'),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: const [
            Icons.home,
            Icons.person,
            Icons.monetization_on,
            Icons.settings, // Adding an additional icon to make the count even
          ],
          safeAreaValues: const SafeAreaValues(
              left: true, right: true, bottom: true, top: true),
          inactiveColor: Colors.grey[400],
          activeColor: Colors.red[400],
          splashColor: Colors.red[300],
          activeIndex: _currentIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            // Handle navigation to different screens based on index
            switch (index) {
              case 0:
                // Navigate to home screen
                break;
              case 1:
                // Navigate to profile screen
                Get.to(const ProfileScreen());
                break;
              case 2:
                Get.to(const Placingorder());
                break;
              case 3:
                // Navigate to messages screen
                break;
              case 4:
                // Navigate to bag screen
                break;
              case 5:
                // Navigate to settings screen
                break;
            }
          },
        ));
  }
}
