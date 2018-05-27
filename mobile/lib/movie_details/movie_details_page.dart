import 'package:flutter/material.dart';
import 'package:mobile/movie_details/character_scroller.dart';
import 'package:mobile/movie_details/movie_detail_header.dart';
import 'package:mobile/movie_details/story_line.dart';
import 'package:models/models.dart';

class MovieDetailsPage extends StatelessWidget {
  MovieDetailsPage(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Column(
          children: [
            new MovieDetailHeader(movie),
            new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Description(movie.description),
            ),
            new CharactersScroller(movie.mainCharacters),
          ],
        ),
      ),
    );
  }
}
