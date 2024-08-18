class CarModel {
  final int id;
  final String plat_number;
  final String description;
  final String image;
  final int color_vehicle_id;
  final int vehicle_category_id;
  final int user_id;

  const CarModel({
    required this.id,
    required this.plat_number,
    required this.description,
    required this.image,
    required this.color_vehicle_id,
    required this.vehicle_category_id,
    required this.user_id,
  });

  factory CarModel.fromJson(dynamic json) => CarModel(
        id: json["id"],
        plat_number: json["plat_number"],
        description: json["description"],
        image: json["image"],
        color_vehicle_id: json["color_vehicle_id"],
        vehicle_category_id: json["vehicle_category_id"],
        user_id: json["user_id"],
      );
}
