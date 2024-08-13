import 'package:ecommerce_application/controller/ListOurParking_controller.dart';
import 'package:ecommerce_application/core/constant/colors.dart';
import 'package:ecommerce_application/view/widget/home/OurParkingCart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OurParkingList extends StatelessWidget {
  const OurParkingList({super.key});
  @override
  Widget build(BuildContext context) {
    OurParkingControllerImp controller = Get.put(OurParkingControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'Parking',
            style: TextStyle(color: AppColor.grey),
          ),
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       controller.getAllFavorite();
          //     },
          //     icon: Icon(Icons.refresh),
          //     color: AppColor.purple,
          //   )
          // ],
        ),
        body: GetBuilder<OurParkingControllerImp>(builder: (_) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            return OurParkingCart(
                              nameProduct: "mahmoud",
                              price: "556",
                              id: "8",
                              description:
                                  'fdlfk lfkdlf woe pwpo mfe ef ewf  fdlfk lfkdlf woe pwpo mfe ef ewf  fdlfk lfkdlf woe pwpo mfe ef ewf  wefw edw ',
                              imagePath: 'assets/images/logocar.png',
                            );
                            // CartItemSamples(
                            //   nameProduct: controller.listProductCart[index]
                            //       ['Name'],
                            //   price: controller.listProductCart[index]['Price']
                            //       .toString(),
                            //   quantity: controller.listProductCart[index]
                            //           ['Quantity']
                            //       .toString(),
                            //   idProduct: controller.listProductCart[index]['id']
                            //       .toString(),
                            // );
                          },
                          separatorBuilder: (context, index) => Divider(
                                indent: 20,
                                endIndent: 20,
                              ),
                          itemCount: 5),

                      //   controller.listFavorite.isEmpty
                      //       ? Center(
                      //           child: Text('there is no products'),
                      //         )
                      //       : ListView.separated(
                      //           shrinkWrap: true,
                      //           physics: NeverScrollableScrollPhysics(),
                      //           itemBuilder: (context, i) {
                      //             return FavoriteCart(
                      //               nameProduct: controller.listFavorite[i]
                      //                   ['Name'],
                      //               price: controller.listFavorite[i]['Price']
                      //                   .toString(),
                      //               id: controller.listFavorite[i]['id']
                      //                   .toString(),
                      //             );
                      //             // CartItemSamples(
                      //             //   nameProduct: controller.listProductCart[index]
                      //             //       ['Name'],
                      //             //   price: controller.listProductCart[index]['Price']
                      //             //       .toString(),
                      //             //   quantity: controller.listProductCart[index]
                      //             //           ['Quantity']
                      //             //       .toString(),
                      //             //   idProduct: controller.listProductCart[index]['id']
                      //             //       .toString(),
                      //             // );
                      //           },
                      //           separatorBuilder: (context, index) => Divider(
                      //                 color: Colors.black,
                      //               ),
                      //           itemCount: controller.listFavorite.length),
                    ],
                  ),
                ),
              ),
              // CartBottomNavBar(
              //   textbutton: "Check Out",
              //   onPressed: () {},
              //   totalprice: controller.totalPrice.toString(),
              // )
            ],
          );
        }));
  }
}
