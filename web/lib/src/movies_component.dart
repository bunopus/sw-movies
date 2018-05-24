import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:models/models.dart';

import '../movies_service.dart';

@Component(
  selector: 'movies',
  templateUrl: 'movies_component.html',
  styleUrls: const ['movies_component.css'],
  directives: const [NgFor, NgIf, routerDirectives],
)
class MoviesComponent implements OnActivate {
  final MoviesService _moviesService;

  Movies movies;

  MoviesComponent(this._moviesService);

  String getMovieLink(Movie item) {
    return '/movie/${item.episodeNumber}';
  }

  @override
  Future onActivate(_, RouterState current) async {
    movies = await _moviesService.getMovies();
  }
}
