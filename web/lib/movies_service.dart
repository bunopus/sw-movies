import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:models/models.dart';


import 'package:angular/angular.dart';

/// Represents the base URL for HTTP requests using [MoviesService].
const OpaqueToken<String> baseUrl = const OpaqueToken<String>('baseUrl');

const String defaultBaseUrl = 'http://localhost:8000/api/get_movies';

class MoviesService {
  final String _baseUrl;

  // Store movies in memory to instantly load when requested.
  Movies _cacheMoviesResult;

  MoviesService(@baseUrl this._baseUrl);

  Future<Movies> getMovies() async {
    final url = '$_baseUrl';
    if (_cacheMoviesResult != null) {
      return _cacheMoviesResult;
    }
    final response = await HttpRequest.getString(url);
    final decoded = json.decode(response) as Map<String, dynamic>;
    return _cacheMoviesResult = new Movies.fromJson(decoded);
  }

  Future<Movie> getMovie(int id) {
    var item = _cacheMoviesResult.movies.firstWhere((Movie item) => item.episodeNumber == id);
    return new Future.value(item);
  }
}
