import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart' as cc;
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart ' as http;

import '../../controller/login2Controller.dart';

class Addingcar extends StatefulWidget {
  const Addingcar({super.key});

  @override
  State<Addingcar> createState() => _AddingcarState();
}

class _AddingcarState extends State<Addingcar> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController plat_number = TextEditingController();
    final TextEditingController description = TextEditingController();

    // String? colorrr = "White";
    //TextEditingController colorr = TextEditingController();
    //final TextEditingController category = TextEditingController();

    String? Colourselectedvalue;
    String? Categoryselectedvalue;

    // File? image;
    // final imagepicker = ImagePicker();

    // Future uploadImage() async {
    //   var pickedImage =
    //       await imagepicker.pickImage(source: ImageSource.gallery);
    //   if (pickedImage != null)
    //     image = File(pickedImage.path);
    //   else {}
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add A New Car !"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // -- IMAGE with ICON
              // Stack(
              //   children: [
              //     // width: 120,

              //     // CircleAvatar(

              //     //   radius: 75, // Image radius
              //     //   backgroundImage: AssetImage('assets/images/Mercedes.jpg'),
              //     // ),

              //     image == null
              //         ? ClipOval(
              //             child: SizedBox.fromSize(
              //               size: const Size.fromRadius(60), // Image radius
              //               child: Image.asset('assets/images/Mercedes.jpg',
              //                   fit: BoxFit.cover),
              //             ),
              //           )
              //         : ClipOval(
              //             child: SizedBox.fromSize(
              //               size: const Size.fromRadius(60), // Image radius
              //               child: Image.file(image!, fit: BoxFit.cover),
              //             ),
              //           ),

              //     // ClipOval(
              //     //   child: SizedBox.fromSize(
              //     //     size: Size.fromRadius(60), // Image radius
              //     //     child: Image.asset('assets/images/Mercedes.jpg',
              //     //         fit: BoxFit.cover),
              //     //   ),
              //     // ),

              //     Positioned(
              //       bottom: 0,
              //       right: 0,
              //       child: GestureDetector(
              //         onTap: () async {
              //           uploadImage();
              //           setState(() {});
              //         },
              //         child: Container(
              //           width: 35,
              //           height: 35,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(100),
              //               color: Colors.blue),
              //           child: const Icon(Icons.edit,
              //               color: Colors.black, size: 20),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 50),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: plat_number,
                      decoration: InputDecoration(
                        label: const Text("plate number"),
                        prefixIcon:
                            const Icon(Icons.format_list_numbered_rounded),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            )),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: description,
                      decoration: InputDecoration(
                        label: const Text("Description"),
                        prefixIcon: const Icon(Icons.message),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            )),
                      ),
                    ),
                    const SizedBox(height: 20),

                    DropdownMenu(
                        initialSelection: Colourselectedvalue,
                        width: 372,
                        inputDecorationTheme: InputDecorationTheme(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              )),
                        ),
                        // controller: colorr,
                        enableSearch: false,
                        onSelected: (String? newvalue) {
                          setState(() {
                            Colourselectedvalue = newvalue;
                          });
                        },
                        dropdownMenuEntries: <DropdownMenuEntry<String>>[
                          DropdownMenuEntry(value: "1", label: "white"),
                          DropdownMenuEntry(value: "2", label: "Black"),
                          DropdownMenuEntry(value: "3", label: "Silver"),
                          DropdownMenuEntry(value: "4", label: "Gray"),
                          DropdownMenuEntry(value: "5", label: "Blue"),
                          DropdownMenuEntry(value: "6", label: "Red"),
                          DropdownMenuEntry(value: "7", label: "Green"),
                          DropdownMenuEntry(value: "8", label: "Brown"),
                          DropdownMenuEntry(value: "9", label: "Gold"),
                          DropdownMenuEntry(value: "10", label: "Purble"),
                        ])

                    // TextFormField(
                    //   controller: color,
                    //   decoration: InputDecoration(
                    //     label: const Text("Colour"),
                    //     prefixIcon: const Icon(Icons.color_lens_outlined),
                    //     enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(25),
                    //         borderSide: const BorderSide(color: Colors.blue)),
                    //     focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(25),
                    //         borderSide: const BorderSide(
                    //           color: Colors.blue,
                    //         )),
                    //   ),
                    // ),
                    ,

                    SizedBox(
                      height: 20,
                    ),

                    DropdownMenu(
                        initialSelection: Categoryselectedvalue,
                        width: 372,
                        inputDecorationTheme: InputDecorationTheme(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              )),
                        ),
                        //  controller: category,
                        enableSearch: false,
                        // label: Text("Car"),
                        onSelected: (category) {
                          setState(() {
                            Categoryselectedvalue = category;
                          });
                        },
                        dropdownMenuEntries: <DropdownMenuEntry<String>>[
                          DropdownMenuEntry(value: "1", label: "Car"),
                          DropdownMenuEntry(value: "2", label: "puck up Truck"),
                          DropdownMenuEntry(value: "3", label: "Large Truck"),
                          DropdownMenuEntry(value: "4", label: "Motor cycle"),
                          DropdownMenuEntry(value: "5", label: "Byscle"),
                          DropdownMenuEntry(
                              value: "6", label: "Delivery truck"),
                        ]),

                    const SizedBox(height: 20),

                    // TextFormField(
                    //   controller: category,
                    //   obscureText: true,
                    //   decoration: InputDecoration(
                    //     label: const Text("category"),
                    //     prefixIcon: const Icon(Icons.bus_alert_outlined),
                    //     enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(25),
                    //         borderSide: const BorderSide(color: Colors.blue)),
                    //     focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(25),
                    //         borderSide: const BorderSide(
                    //           color: Colors.blue,
                    //         )),
                    //   ),
                    // ),
                    const SizedBox(height: 30),

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          print(Colourselectedvalue);
                          print(Categoryselectedvalue);

                          print(plat_number.text);
                          print(description.text);
                          print(Login2ControllerImp.user_id);

                          print("start from here");

                          var response = await http.post(
                              Uri.parse(
                                  'http://10.0.2.2:8000/api/storeVehicle'),
                              headers: <String, String>{
                                'Accept': 'application/json',
                              },
                              body: {
                                'plat_number': '44444',
                                'description': 'Mercedes',
                                'color_vehicle_id': '1',
                                'vehicle_category_id': '2',
                                'user_id': Login2ControllerImp.user_id,
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

                            // return Right(responseBody);
                          } else {
                            Get.defaultDialog(
                              // title: 'serverFailure',
                              middleText: 'failed to add car',
                            );
                            // Get.to(HomePage());
                            //return const Left(StatusRequest.serverFailure);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text("Done",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // -- Created Date and Delete Button
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // const Text.rich(
                        //   TextSpan(
                        //     text: "tJoined",
                        //     style: TextStyle(fontSize: 12),
                        //     children: [

                        //       TextSpan(
                        //           text: "tJoinedAt",
                        //           style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 12))
                        //     ],
                        //   ),
                        // ),

                        // ElevatedButton(
                        //   onPressed: () {},
                        //   style: ElevatedButton.styleFrom(
                        //       backgroundColor:
                        //           Colors.green,
                        //       elevation: 0,
                        //       foregroundColor: Colors.green,
                        //       shape: const StadiumBorder(),
                        //       side: BorderSide.none),
                        //   child: const Text("Done"),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
