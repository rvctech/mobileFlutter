import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tunyce/core/common/constants.dart';
import 'package:tunyce/models/genre_model.dart';
import 'package:tunyce/models/video_response.dart';

class HomeRepositoy {
  Future<dynamic> fetchGenres() async {
    try {
      final response = await http.get(
        Uri.parse('${Constants.baseURL}/videos/all_video_types/v1/'),
        headers: {'Content-Type': 'application/json'},
      );
      // var decodedRes = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final genreData = genreDataFromJson(response.body);
        return genreData;
      } else {}
    } catch (e) {
      log('Error: $e');
    }
  }

  Future<dynamic> fetchVideos() async {
    try {
      final response = await http.get(
        Uri.parse('${Constants.baseURL}/videos/mixes/latest/v1/'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final videoData = videoDataFromJson(response.body);
        return videoData;
      } else {
        return null;
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
