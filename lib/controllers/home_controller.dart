import 'package:tunyce/models/genre_model.dart';
import 'package:tunyce/repositories/home_repository.dart';

import 'base_controller.dart';

class HomeController extends BaseController {
  final homeRepository = HomeRepositoy();

  List<GenreData>? _genreData;
  List<GenreData>? get genreData => _genreData;

  @override
  void onInit() {
    fetchGenres();
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
}
