import 'package:flutter/material.dart';
import 'package:mobile/movie_details/arc_banner_image.dart';
import 'package:mobile/movie_details/poster.dart';
import 'package:models/models.dart';

class MovieDetailHeader extends StatelessWidget {
  MovieDetailHeader(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    var movieInformation = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        new Text(
          movie.title,
          style: textTheme.title,
        ),
      ],
    );

    return new Stack(
      children: [
        new Padding(
          padding: const EdgeInsets.only(bottom: 140.0),
          child: new ArcBannerImage(movie.heroImage),
        ),
        new Positioned(
          top: 30.0,
          child: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        new Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              new Poster(
                movie,
                height: 180.0,
              ),
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: movieInformation,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
