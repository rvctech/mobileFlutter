import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tunyce/core/common/constants.dart';
import 'package:tunyce/models/genre_model.dart';

class HomeRepositoy {
  Future<dynamic> fetchGenres() async {
    try {
      final response = await http.get(
        Uri.parse('${Constants.baseURL}/videos/all_video_types/v1/'),
        headers: {'Content-Type': 'application/json'},
      );
      var decodedRes = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final genreData = genreDataFromJson(response.body);
        return genreData;
      } else {
        Map<String, dynamic> errorMap = decodedRes;

        // Get error message from the value
        String errorMessage = errorMap.values.first;

        // {"detail":"Invalid credentials try again"}
        return null;
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
