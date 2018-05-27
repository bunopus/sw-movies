import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/movie_grid/movie_grid.dart';
import 'package:models/models.dart';


Future<Movies> fetchMovies() async {
  final response =
  await http.get('http://10.0.2.2:8000/api/get_movies');
  final responseJson = json.decode(response.body);

  return new Movies.fromJson(responseJson);
}

class StarWarsMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Star Wars Movies',
      home: new Scaffold(
        body: new Center(
          child: new FutureBuilder<Movies>(
            future: fetchMovies(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new MoviesGridPage(movies: snapshot.data.movies);
              } else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }
              // By default, show a loading spinner
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(new StarWarsMovies());
}
