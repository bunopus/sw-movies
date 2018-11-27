// Ignore generated templates imported for route definitions.
// ignore_for_file: uri_has_not_been_generated

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:web/src/header_component.dart';

import 'src/movies_component.template.dart' as movies;
import 'src/movie_detail_component.template.dart' deferred as movie_detail;
import 'src/routes.dart';

@Component(
  selector: 'app',
  templateUrl: 'app_component.html',
  directives: const [routerDirectives, HeaderComponent],
  styleUrls: const ['app_component.css'],
  // Disabled. We use global styles that are used before the JavaScript loads.
  //
  // See web/index.html's <style> tag.
  encapsulation: ViewEncapsulation.None,
)
class AppComponent {
  static final moviesUrl = moviesRoutePath.toUrl();

  static final routes = [
    new RouteDefinition(
      routePath: moviesRoutePath,
      component: movies.MoviesComponentNgFactory,
    ),
    new RouteDefinition.defer(
      routePath: movieDetailRoutePath,
      loader: () async {
        await movie_detail.loadLibrary();
        return movie_detail.MovieDetailComponentNgFactory;
      },
    ),
  ];
}
