import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tunyce/models/genre_model.dart';
import 'package:tunyce/models/latest_mix_response.dart';
import 'package:tunyce/models/seach_results_model.dart';
import 'package:tunyce/repositories/home_repository.dart';

import 'base_controller.dart';

class HomeController extends BaseController {
  final homeRepository = HomeRepositoy();

  List<GenreData>? _genreData;
  List<GenreData>? get genreData => _genreData;
  List<LatestMix>? _latesMixes;
  List<LatestMix>? get latestMixes => _latesMixes;

  // Search results
  Rx<List<Video>> searchedVideos = Rx<List<Video>>([]);

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    fetchGenres();
    fetchLatestMixes();
    searchVideos("");
    super.onInit();
  }

  fetchGenres() async {
    setLoading(true);
    var res = await homeRepository.fetchGenres();
    if (res != null) {
      _genreData = res;
    }
    setLoading(false);
  }

  fetchLatestMixes() async {
    setLoading(true);
    var res = await homeRepository.fetchLatestMixes();
    if (res != null) {
      _latesMixes = res;
    }
    setLoading(false);
  }

  searchVideos(String query) async {
    setLoading(true);
    var res = await homeRepository.searchVideos(query);
    if (res is List<Video>) {
      searchedVideos.value = res;
    }
    setLoading(false);
  }
}
