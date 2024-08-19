import 'dart:convert';

import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/data/datasource/remote/car_data.dart';
import 'package:ecommerce_application/data/datasource/remote/parking_map/parking_data.dart';
import 'package:ecommerce_application/data/model/car_model.dart';
import 'package:ecommerce_application/data/model/parking_model.dart';
import 'package:ecommerce_application/main.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';

const recentSearchParkingKey = 'searchParking';

abstract class CarController extends GetxController {
  Future<void> addCar(int parkingId, int slotId);
  Future<void> allCars();
}

class CarControllerImp extends CarController {
  final myServices = Get.find<MyServices>();
  final carData = const CarData();
  @override
  Future<void> onInit() async {
    await allCars();
    super.onInit();
  }

  @override
  Future<void> addCar(int parkingId, int slotId) {
    // TODO: implement addCar
    throw UnimplementedError();
  }

  List<CarModel>? cars;
  @override
  Future<void> allCars() async {
    cars = await carData.allCars();
    if (cars != null && cars != []) {
      // sharedStorage.setString('cars', jsonEncode({'cars': cars}));
    }
    update();
  }
}
