import 'dart:convert';

class ParkingModel {
  final int id;
  final double longitude;
  final double latitude;
  final String name;
  final int numberSlots;

  ParkingModel({
    required this.id,
    required this.longitude,
    required this.latitude,
    required this.name,
    required this.numberSlots,
  });

  factory ParkingModel.fromRawJson(String str) =>
      ParkingModel.fromJson(json.decode(str));

  factory ParkingModel.fromJson(dynamic json) => ParkingModel(
        id: json["id"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        name: json["name"],
        numberSlots: json["number_slots"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "longitude": longitude,
        "latitude": latitude,
        "name": name,
        "number_slots": numberSlots,
      };
}

class FindClosestTimeModel {
  final int slotId;
  final DateTime from;
  final DateTime to;

  const FindClosestTimeModel(
      {required this.slotId, required this.from, required this.to});

  factory FindClosestTimeModel.fromJson(dynamic json) => FindClosestTimeModel(
        from: DateTime.parse(json['from']),
        to: DateTime.parse(json['to']),
        slotId: int.parse(json['slot_id']),
      );
}
