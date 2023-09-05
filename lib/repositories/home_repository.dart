import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tunyce/core/common/constants.dart';
import 'package:tunyce/models/genre_model.dart';
import 'package:tunyce/models/latest_mix_response.dart';
import 'package:tunyce/models/seach_results_model.dart';

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

  Future<dynamic> fetchLatestMixes() async {
    try {
      final response = await http.get(
        Uri.parse('${Constants.baseURL}/videos/mixes/latest/v1/'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final mixData = latestMixFromJson(response.body);
        return mixData;
      } else {
        return null;
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  Future<dynamic> searchVideos(String searchQuery) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.baseURL}/global_search/search_video/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'search_query': searchQuery,
        }),
      );
      var decodedRes = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final searchResults = searchResultsFromJson(response.body);
        return searchResults.videos;
      } else {
        log('Error: $decodedRes');
      }
    } on SocketException catch (e) {
      log('Error: $e');
      throw 'Check your internet connection';
    } catch (e) {
      log('Error: $e');
      return 'Error: $e';
    }
  }
}
