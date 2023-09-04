//     final genreData = genreDataFromJson(jsonString);

import 'dart:convert';

List<GenreData> genreDataFromJson(String str) =>
    List<GenreData>.from(json.decode(str).map((x) => GenreData.fromJson(x)));

String genreDataToJson(List<GenreData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GenreData {
  int id;
  String? name;
  String? description;
  String? image;

  GenreData({
    required this.id,
    this.name,
    this.description,
    this.image,
  });

  factory GenreData.fromJson(Map<String, dynamic> json) => GenreData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
      };
}
