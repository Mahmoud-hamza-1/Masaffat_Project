import 'package:ecommerce_application/core/services/services.dart';
import 'package:ecommerce_application/data/datasource/remote/parking_map/parking_data.dart';
import 'package:ecommerce_application/data/model/parking_model.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:get/get.dart';

const recentSearchParkingKey = 'searchParking';

abstract class ParkingController extends GetxController {
  List<String>? getRecentSearchParking();
  Future<bool> setSearchParking();
  void addSearchParking(String searchParking);
  void deleteSearchParking(int index);
  Future<List<ParkingModel>?> searchByCoordinates(GeoPoint point);
  void updateCheckIn(DateTime newCheckIn, DateTime newCheckOut);
  void addBooking(int parkingId);
}

class ParkingControllerImp extends ParkingController {
  final myServices = Get.find<MyServices>();
  late List<String> recentSearchParking;
  List<ParkingModel>? parkings;
  final parkingData = const ParkingData();
  DateTime checkIn = DateTime.now(), checkOut = DateTime.now();

  @override
  void onInit() {
    recentSearchParking = getRecentSearchParking() ?? [];
    super.onInit();
  }

  @override
  List<String>? getRecentSearchParking() {
    recentSearchParking =
        myServices.sharedPrefernces.getStringList(recentSearchParkingKey) ?? [];
    return recentSearchParking;
  }

  @override
  Future<bool> setSearchParking() async {
    final result = await myServices.sharedPrefernces
        .setStringList(recentSearchParkingKey, recentSearchParking);
    return result;
  }

  @override
  Future<void> addSearchParking(String searchParking) async {
    recentSearchParking.add(searchParking);
    await myServices.sharedPrefernces
        .setStringList(recentSearchParkingKey, recentSearchParking);
    update();
  }

  @override
  Future<void> deleteSearchParking(int index) async {
    recentSearchParking.removeAt(index);
    await myServices.sharedPrefernces
        .setStringList(recentSearchParkingKey, recentSearchParking);
    update();
  }

  @override
  Future<List<ParkingModel>?> searchByCoordinates(GeoPoint point) async {
    final res = await parkingData.searchByCoordinates(point);
    return res.fold((l) => l, (_) => null);
  }

  @override
  void updateCheckIn(DateTime newCheckIn, DateTime newCheckOut) {
    checkIn = newCheckIn;
    checkOut = newCheckOut;
    update();
  }

  @override
  void addBooking(int parkingId) {
    final res = parkingData.addBooking(parkingId, checkIn, checkOut);
  }
}
