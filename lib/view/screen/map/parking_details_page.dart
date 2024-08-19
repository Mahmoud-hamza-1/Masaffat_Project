import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'package:ecommerce_application/link_api.dart';
import 'package:ecommerce_application/main.dart';

class ParkingDetailsPage extends StatefulWidget {
  const ParkingDetailsPage(
      {super.key,
      required this.parkingId,
      required this.checkIn,
      required this.checkOut,
      required this.carId});

  final int parkingId;
  final int carId;
  final DateTime checkIn;
  final DateTime checkOut;
  @override
  State<ParkingDetailsPage> createState() => _ParkingDetailsPageState();
}

class _ParkingDetailsPageState extends State<ParkingDetailsPage> {
  bool isLoading = true;
  List listData = [];
  late final Map user;
  String svgPath = '';
  @override
  void initState() {
    user = jsonDecode(sharedStorage.getString('user') ?? '');
    closestAvailableTime();
    super.initState();
  }

  Future<void> closestAvailableTime() async {
    final response = await post(
      Uri.parse(AppLink.findClosestAvailableTime),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "parking_id": widget.parkingId.toString(),
        "from": DateFormat.Hm().format(widget.checkIn),
        "to": DateFormat.Hm().format(widget.checkOut),
      }),
    );
    final newCheckIn = DateFormat.Hm().format(widget.checkIn);
    final newCheckOut = DateFormat.Hm().format(widget.checkOut);

    print(widget.parkingId.toString());
    print(DateFormat.Hm().format(widget.checkIn));
    print(DateFormat.Hm().format(widget.checkOut));
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      listData = (jsonDecode(response.body) as List);
      print(listData);
      var slotId = listData[0]['slot_id'];
      var from = DateFormat.Hm().format(DateTime.parse(listData.first['from']));
      var to = DateFormat.Hm().format(DateTime.parse(listData.first['to']));
      if (listData.length == 1 &&
          from.compareTo(newCheckIn) == 0 &&
          to.compareTo(newCheckOut) == 0) {
        final response = await post(
          Uri.parse('${AppLink.addBooking}/${widget.parkingId}/$slotId'),
          headers: {
            'accept': 'application/json',
          },
          body: {
            "vehicle_id": widget.carId.toString(),
            "from": DateFormat.Hm().format(widget.checkIn),
            "to": DateFormat.Hm().format(widget.checkOut),
          },
        );
        print(widget.carId);
        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.body);
          if (jsonDecode(response.body)["message"] != '') {
            Get.defaultDialog(
              middleText: jsonDecode(response.body)["message"],
            );
          }
          svgPath =
              "$baseUrl1/${jsonDecode(response.body)["booking"]['booking']['qr_code']}";
          setState(() {
            isLoading = false;
          });
          print(svgPath);
        } else {
          print(response.body);
          setState(() {
            isLoading = false;
          });
          Get.defaultDialog(
            middleText: jsonDecode(response.body)["message"],
          );
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: svgPath.isNotEmpty
            ? const Text('Qr Code')
            : const Text('time available'),
      ),
      body: svgPath.isNotEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Save this Qrcode',
                  style: TextStyle(fontSize: 22),
                ),
                Center(
                  child: SvgPicture.network(
                    svgPath,
                    placeholderBuilder: (context) =>
                        const CircularProgressIndicator(),
                  ),
                ),
              ],
            )
          : isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : listData.isEmpty
                  ? const Center(
                      child: Text(
                          'No available times found within the requested range'),
                    )
                  : Column(
                      children: [
                        const Text('choose time for booking'),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: listData.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 150,
                          ),
                          itemBuilder: (context, index) => ListTile(
                            tileColor: Colors.grey.shade300,
                            onTap: () async {
                              setState(() {
                                isLoading = true;
                              });
                              final response = await post(
                                Uri.parse(
                                    '${AppLink.addBooking}/${widget.parkingId}/${listData[index]['slot_id']}'),
                                headers: {
                                  'accept': 'application/json',
                                },
                                body: {
                                  "user_id": user['id'],
                                  "from": widget.checkIn,
                                  "to": widget.checkOut,
                                },
                              );
                              print(response);
                              setState(() {
                                isLoading = false;
                              });
                            },
                            title: Text(
                                'from: ${listData[index]['from']} \t to:${listData[index]['to']}'),
                          ),
                        ),
                      ],
                    ),
    );
  }
}
