import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:angular/angular.dart';

/// Represents the base URL for HTTP requests using [MoviesService].
const OpaqueToken<String> baseUrl = const OpaqueToken<String>('baseUrl');

const String defaultBaseUrl = 'http://localhost:8000/api/get_movies';

class MoviesService {
  final String _baseUrl;

  // Store movies in memory to instantly load when requested.
  List<Map> _cacheMoviesResult;

  MoviesService(@baseUrl this._baseUrl);

  Future<List<Map>> getMovies() async {
    final url = '$_baseUrl';
    if (_cacheMoviesResult != null) {
      return _cacheMoviesResult;
    }
    final response = await HttpRequest.getString(url);
    final decoded = json.decode(response) as List<dynamic>;
    return _cacheMoviesResult = decoded.cast<Map>();
  }

  Future<Map> getMovie(int id) {
    var item = _cacheMoviesResult.firstWhere((Map item) => item['episode_number'] == id);
    return new Future.value(item);
  }
}
