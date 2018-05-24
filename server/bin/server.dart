import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:server/src/database.dart';
import 'package:server/src/movie.dart';
import 'package:server/src/movies.dart';

Future main() async {
  const port = 8000;

  final HttpServer server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    port,
  );

  print('Listening on ${port}');

  server.where((HttpRequest req) {
    return req.method == 'GET' && req.uri.toString() == '/api/get_movies';
  }).listen(onData);
}

void onData(HttpRequest event) {
  final movies = new Movies.fromJson(Database.getMovies()).movies;

  final goodMovies = movies.where((Movie mov) => mov.title != 'Star Wars: Episode VII - The Force Awakens').toList();

  final encoded = const JsonEncoder().convert(goodMovies);

  event.response
    ..statusCode = HttpStatus.OK
    // only for demo purpose, remove in production
    ..headers.add('Access-Control-Allow-Origin', '*')
    ..write(encoded)
    ..close();
}



