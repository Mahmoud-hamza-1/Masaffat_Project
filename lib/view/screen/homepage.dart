import 'package:animate_do/animate_do.dart';
import 'package:ecommerce_application/view/widget/auth/custombuttonAuth.dart';
import 'package:ecommerce_application/view/widget/home/customhomeWidget.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final List<String> imgList = [
    'assets/images/ads1.png',
    'assets/images/ads2.png',
    'assets/images/ads3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Masaffat',
          style: TextStyle(fontFamily: "assets/fonts/Poppins-Black.ttf "),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.qr_code_scanner_rounded),
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
                          child:
                              Image.asset(item, fit: BoxFit.cover, width: 1000),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            // Icons Section
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Choose Service "),
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
                    onPressed: () {},
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
              child: Center(
                child: Text(
                  'Way Services Near You',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'My Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'My Bag'),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {},
      ),
    );
  }
}
