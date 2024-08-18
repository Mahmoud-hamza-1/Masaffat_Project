import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/data/model/car_model.dart';
import 'package:ecommerce_application/data/model/parking_model.dart';
import 'package:ecommerce_application/link_api.dart';
import 'package:ecommerce_application/main.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';

import '../../../../core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

class CarData {
  const CarData();

  // Future<Either<List<ParkingModel>, String>> addCar(
  //     String platNumber,String description,int color_vehicle_id) async {
  //   try {
  //     if (await checkInternet()) {
  //       var response = await http.post(
  //         Uri.parse(AppLink.searchParkingRadius),
  //         headers: <String, String>{
  //           'Accept': 'application/json',
  //         },
  //         body: {
  //           "latitude": '${point.latitude}',
  //           "longitude": '${point.longitude}',
  //         },
  //       );

  //       print(response.body);

  //       if (response.statusCode == 200) {
  //         final responseBody =
  //             jsonDecode(response.body)["parkings"] as List<dynamic>;
  //         return left(
  //             responseBody.map((e) => ParkingModel.fromJson(e)).toList());
  //       } else {
  //         Get.defaultDialog(
  //           title: 'serverFailure',
  //           middleText: jsonDecode(response.body)["msg"],
  //         );
  //         return right('${jsonDecode(response.body)["msg"]}');
  //       }
  //     } else {
  //       Get.defaultDialog(
  //         title: 'no internet',
  //         middleText: 'offLineFailure',
  //       );
  //       return right('no internet');
  //     }
  //   } catch (e) {
  //     Get.defaultDialog(
  //       title: 'serverException',
  //       middleText: '$e',
  //     );
  //     return right('$e');
  //   }
  // }

  Future<List<CarModel>?> allCars() async {
    try {
      final data = sharedStorage.getString('user');
      final user = data != null
          ? jsonDecode(data)
          : throw Exception('you have to login');
      print(user['id']);
      var response = await http.get(
          Uri.parse('${AppLink.getVehiclesByUser}/${user['id']}'),
          headers: <String, String>{
            'Accept': 'application/json',
          });

      print(response.body);

      if (response.statusCode == 200) {
        final responseBody =
            jsonDecode(response.body)["vehicles"] as List<dynamic>;
        return responseBody.map((e) => CarModel.fromJson(e)).toList();
      } else {
        Get.defaultDialog(
          title: 'serverFailure',
          middleText: jsonDecode(response.body)["msg"],
        );
        return null;
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'serverException',
        middleText: '$e',
      );
      return null;
    }
  }

  Future<List<FindClosestTimeModel>?> findClosestAvailableTime(
      DateTime from, DateTime to, int parkingId) async {
    try {
      var response = await http.post(
        Uri.parse('${AppLink.findClosestAvailableTime}//'),
        headers: <String, String>{
          'Accept': 'application/json',
        },
        body: {
          "from": '$from',
          "to": '$to',
          "parking_id": "$parkingId",
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body) as List<dynamic>;
        return responseBody
            .map((e) => FindClosestTimeModel.fromJson(e))
            .toList();
      } else {
        Get.defaultDialog(
          title: 'serverFailure',
          middleText: jsonDecode(response.body)["msg"],
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'serverException',
        middleText: '$e',
      );
    }
    return null;
  }
}
