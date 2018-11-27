import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

// We are ignoring files that will be generated at compile-time.
// ignore: uri_has_not_been_generated, uri_does_not_exist
import 'package:web/app_component.template.dart' as app;
import 'package:web/movies_service.dart';

// We are ignoring files that will be generated at compile-time.
// ignore: uri_has_not_been_generated
import 'main.template.dart' as ng;

@GenerateInjector(const [
  // HTTP and Services.
  const FactoryProvider(MoviesService, getMoviesService),

  // SPA Router.
  routerProviders,
])
final InjectorFactory swMoviesApp = ng.swMoviesApp$Injector;

MoviesService _service;
MoviesService getMoviesService() => _service;

void main() async {
  _service = new MoviesService(defaultBaseUrl);

  Future future;
  final path = window.location.pathname;

  // prefetch everything
  if (window.location.search.isEmpty && !path.startsWith('/movie')) {
    future = _service.getMovies();
  }

  // Start app after fetched.
  await future;

  runApp(
    app.AppComponentNgFactory,
    createInjector: swMoviesApp,
  );
}
