import 'package:animate_do/animate_do.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import 'package:ecommerce_application/view/screen/map/parking_page.dart';
import 'package:ecommerce_application/view/widget/auth/custombuttonAuth.dart';
import 'package:ecommerce_application/view/widget/home/customhomeWidget.dart';

import 'listSearch.dart';
import 'listSearch.dart';
import 'map/map_screen.dart';
import 'map/map_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'assets/images/ads1.png',
    'assets/images/ads2.png',
    'assets/images/ads3.png',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: Text(
            'Masaffat',
            style: TextStyle(fontFamily: "assets/fonts/Poppins-Black.ttf "),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.local_parking_rounded,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Slider Section
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 4),
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  scrollDirection: Axis.horizontal,
                ),
                items: imgList
                    .map((item) => Container(
                          child: Center(
                            child: Image.asset(item,
                                fit: BoxFit.cover, width: 1000),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(height: 16),
              // Icons Section
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Choose Service"),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Customhomewidget(
                      label: "Parking",
                      path: 'assets/icons/parking.png',
                      onPressed: () {
                        Get.to(ParkingPage());
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
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(height: 16),
              // Middle Banner Section
              Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pay Less for Car Expenses',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Choose Service'),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Compare Price'),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Get Cashback'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
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
          icons: [
            Icons.home,
            Icons.person,
            Icons.message,
            Icons.settings, // Adding an additional icon to make the count even
          ],
          safeAreaValues:
              SafeAreaValues(left: true, right: true, bottom: true, top: true),
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
                break;
              case 2:
                // Navigate to orders screen
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
