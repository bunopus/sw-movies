import 'package:angular_router/angular_router.dart';

final moviesRoutePath = new RoutePath(
  path: '/',
  useAsDefault: true,
);

final movieDetailRoutePath = new RoutePath(path: '/movie/:id');
