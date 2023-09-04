import 'package:tunyce/models/genre_model.dart';
import 'package:tunyce/models/video_response.dart';
import 'package:tunyce/repositories/home_repository.dart';

import 'base_controller.dart';

class HomeController extends BaseController {
  final homeRepository = HomeRepositoy();

  List<GenreData>? _genreData;
  List<GenreData>? get genreData => _genreData;
  List<VideoData>? _videoData;
  List<VideoData>? get videoList => _videoData;

  @override
  void onInit() {
    fetchGenres();
    fetchVideos();
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

  fetchVideos() async {
    setLoading(true);
    var res = await homeRepository.fetchVideos();
    if (res != null) {
      _videoData = res;
    }
    setLoading(false);
  }
}
