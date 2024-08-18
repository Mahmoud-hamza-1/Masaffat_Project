import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/data/model/parking_model.dart';
import 'package:ecommerce_application/link_api.dart';
import 'package:ecommerce_application/main.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';

import '../../../../core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'http://10.0.2.2:8000/api';

class ParkingData {
  const ParkingData();

  Future<Either<List<ParkingModel>, String>> searchByCoordinates(
      GeoPoint point) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(AppLink.searchParkingRadius),
          headers: <String, String>{
            'Accept': 'application/json',
          },
          body: {
            "latitude": '${point.latitude}',
            "longitude": '${point.longitude}',
          },
        );

        print(response.body);

        if (response.statusCode == 200) {
          final responseBody =
              jsonDecode(response.body)["parkings"] as List<dynamic>;
          return left(
              responseBody.map((e) => ParkingModel.fromJson(e)).toList());
        } else {
          Get.defaultDialog(
            title: 'serverFailure',
            middleText: jsonDecode(response.body)["msg"],
          );
          return right('${jsonDecode(response.body)["msg"]}');
        }
      } else {
        Get.defaultDialog(
          title: 'no internet',
          middleText: 'offLineFailure',
        );
        return right('no internet');
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'serverException',
        middleText: '$e',
      );
      return right('$e');
    }
  }

  Future<Either<List<ParkingModel>, String>> addBooking(
    int parkingId,
    int slotId,
    DateTime from,
    DateTime to,
  ) async {
    try {
      final data = sharedStorage.getString('user');
      final user = data != null
          ? jsonDecode(data)
          : throw Exception('you have to login');
      var response = await http.post(
        Uri.parse('${AppLink.addBooking}/$parkingId/$slotId'),
        headers: <String, String>{
          'Accept': 'application/json',
        },
        body: {
          "from": '$from',
          "to": '$to',
          "user_id": "${user["id"]}",
        },
      );

      print(response.body);

      if (response.statusCode == 200) {
        final responseBody =
            jsonDecode(response.body)["parkings"] as List<dynamic>;
        return left(responseBody.map((e) => ParkingModel.fromJson(e)).toList());
      } else {
        Get.defaultDialog(
          title: 'serverFailure',
          middleText: jsonDecode(response.body)["msg"],
        );
        return right('${jsonDecode(response.body)["msg"]}');
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'serverException',
        middleText: '$e',
      );
      return right('$e');
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
