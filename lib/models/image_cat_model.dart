class ImageCat {
  const ImageCat({
    required this.id,
    this.width,
    this.height,
    required this.url,
  });

  final String id;
  final int? width;
  final int? height;
  final String url;

  ImageCat copyWith({
    String? id,
    url,
    int? width,
    height,
  }) =>
      ImageCat(
        id: id ?? this.id,
        url: url ?? this.url,
        width: width ?? this.width,
        height: height ?? this.height,
      );
  factory ImageCat.fromJson(Map<String, dynamic> json) => ImageCat(
        id: json["id"] ?? "",
        width: json["width"] ?? 0,
        height: json["height"] ?? 0,
        url: json["url"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
      };
}
