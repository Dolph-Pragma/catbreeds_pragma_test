import 'image_cat_model.dart';

class FavoriteCatModel {
  const FavoriteCatModel({
    required this.id,
    required this.imageId,
    required this.createdAt,
    required this.image,
  });

  final int id;
  final String imageId;
  final DateTime createdAt;
  final ImageCat image;

  FavoriteCatModel copyWith({
    int? id,
    String? imageId,
    DateTime? createdAt,
    ImageCat? image,
  }) =>
      FavoriteCatModel(
        id: id ?? this.id,
        imageId: imageId ?? this.imageId,
        createdAt: createdAt ?? this.createdAt,
        image: image ?? this.image,
      );

  factory FavoriteCatModel.fromJson(Map<String, dynamic> json) =>
      FavoriteCatModel(
        id: json["id"],
        imageId: json["image_id"],
        createdAt: DateTime.parse(json["created_at"]),
        image: ImageCat.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_id": imageId,
        "created_at": createdAt.toIso8601String(),
        "image": image.toJson(),
      };
}
