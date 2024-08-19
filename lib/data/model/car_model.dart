class CarModel {
  final int id;
  final String? plat_number;
  final String? description;
  final String? image;
  final int? color_vehicle_id;
  final int? vehicle_category_id;
  final int user_id;

  const CarModel({
    required this.id,
    this.plat_number,
    this.description,
    this.image,
    this.color_vehicle_id,
    this.vehicle_category_id,
    required this.user_id,
  });

  factory CarModel.fromJson(dynamic json) => CarModel(
        id: json["id"],
        plat_number: json["plat_number"],
        description: json["description"] as String?,
        image: json["image"],
        color_vehicle_id: json["color_vehicle_id"],
        vehicle_category_id: json["vehicle_category_id"],
        user_id: json["user_id"],
      );
}
