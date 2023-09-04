// To parse this JSON data, do
//
//     final videoData = videoDataFromJson(jsonString);

import 'dart:convert';

List<VideoData> videoDataFromJson(String str) =>
    List<VideoData>.from(json.decode(str).map((x) => VideoData.fromJson(x)));

String videoDataToJson(List<VideoData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoData {
  int id;
  String? name;
  dynamic videofile;
  String? video;
  String? thumbnail;
  String? torrent;
  int? views;
  DateTime? dateAdded;
  String? description;
  int? category;
  int? owner;

  VideoData({
    required this.id,
    required this.name,
    this.videofile,
    this.video,
    this.thumbnail,
    this.torrent,
    this.views,
    this.dateAdded,
    this.description,
    this.category,
    this.owner,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) => VideoData(
        id: json["id"],
        name: json["name"],
        videofile: json["videofile"],
        video: json["video"],
        thumbnail: json["thumbnail"],
        torrent: json["torrent"],
        views: json["views"],
        dateAdded: DateTime.parse(json["date_added"]),
        description: json["description"],
        category: json["category"],
        owner: json["owner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "videofile": videofile,
        "video": video,
        "thumbnail": thumbnail,
        "torrent": torrent,
        "views": views,
        "date_added": dateAdded?.toIso8601String(),
        "description": description,
        "category": category,
        "owner": owner,
      };
}
