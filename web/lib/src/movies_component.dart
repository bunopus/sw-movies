import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../movies_service.dart';

@Component(
  selector: 'movies',
  templateUrl: 'movies_component.html',
  styleUrls: const ['movies_component.css'],
  directives: const [NgFor, NgIf, routerDirectives],
)
class MoviesComponent implements OnActivate {
  final MoviesService _moviesService;

  List<Map> items;

  MoviesComponent(this._moviesService);

  String getMovieLink(item) {
    return '/movie/${item['episode_number']}';
  }

  @override
  Future onActivate(_, RouterState current) async {
    items = await _moviesService.getMovies();
  }
}
