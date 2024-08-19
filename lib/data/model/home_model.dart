class AdvertModel {
  final int id;
  final String? imagePath;
  final String? imageUrl;

  const AdvertModel({
    required this.id,
    this.imagePath,
    this.imageUrl,
  });

  factory AdvertModel.fromJson(dynamic json) => AdvertModel(
        id: json["id"],
        imagePath: json["image_path"],
        imageUrl: json["image_url"],
      );
}
