import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_application/data/model/parking_model.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';

import '../../../../core/function/checkinternet.dart';
import 'package:http/http.dart' as http;

class ParkingData {
  const ParkingData();

  Future<Either<List<ParkingModel>, String>> searchByCoordinates(
      GeoPoint point) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse("http://192.168.1.106:8000/api/searchParkingsWithinRadius"),
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
}
