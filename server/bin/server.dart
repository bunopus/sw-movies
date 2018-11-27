import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:server/src/database.dart';
import 'package:server/src/movie.dart';
import 'package:server/src/movies.dart';

Future main() async {
  const port = 8000;

  final server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    port,
  );

  print('Listening on ${port}');

  server.where((HttpRequest req) {
    return req.method == 'GET' && req.uri.toString() == '/api/get_movies';
  }).listen(onData);
}

void onData(HttpRequest event) {
  final movies = Movies.fromJson(Database.getMovies()).movies;

  final goodMovies = movies.where((Movie mov) => mov.episodeNumber != 7);

  final encoded = const JsonEncoder().convert(goodMovies.toList());

  event.response
    ..statusCode = HttpStatus.ok
    ..write(encoded)
    ..close();
}



