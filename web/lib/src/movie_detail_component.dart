import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../movies_service.dart';

@Component(
  selector: 'movie-detail',
  templateUrl: 'movie_detail_component.html',
  styleUrls: const ['movie_detail_component.css'],
  directives: const [NgFor, NgIf],
)
class MovieDetailComponent implements OnActivate {
  final MoviesService _moviesService;

  Map movie;
  List<String> characters;

  MovieDetailComponent(this._moviesService);

  @override
  Future onActivate(_, RouterState current) async {
    final id = current.parameters['id'];
    movie = await _moviesService.getMovie(int.parse(id));
    characters = getCharacters(movie['main_characters']);
  }

  List<String> getCharacters(List<dynamic> characters) => characters.cast<String>();
}
