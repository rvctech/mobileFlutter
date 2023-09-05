//     final searchResults = searchResultsFromJson(jsonString);

import 'dart:convert';

SearchResults searchResultsFromJson(String str) =>
    SearchResults.fromJson(json.decode(str));

String searchResultsToJson(SearchResults data) => json.encode(data.toJson());

class SearchResults {
  String query;
  List<Video> videos;

  SearchResults({
    required this.query,
    required this.videos,
  });

  factory SearchResults.fromJson(Map<String, dynamic> json) => SearchResults(
        query: json["query"],
        videos: List<Video>.from(json["videos"].map((x) => Video.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "query": query,
        "videos": List<dynamic>.from(videos.map((x) => x.toJson())),
      };
}

class Video {
  int? id;
  String? name;
  String? videofile;
  String? video;
  dynamic thumbnail;
  dynamic torrent;
  int? views;
  DateTime? dateAdded;
  String? description;
  int? category;
  int? owner;

  Video({
    this.id,
    this.name,
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

  factory Video.fromJson(Map<String, dynamic> json) => Video(
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
