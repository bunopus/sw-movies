
import 'package:flutter/material.dart';
import 'package:mobile/movie_details/movie_details_page.dart';
import 'package:mobile/movie_grid/movie_card.dart';
import 'package:models/models.dart';

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.red,
  accentColor: new Color.fromARGB(1, 180, 30, 42),
);

const double _kAppBarHeight = 200.0;
const double _kMoviePageMaxWidth = 500.0;

class MoviesGridPage extends StatefulWidget {
  const MoviesGridPage({ Key key, this.movies }) : super(key: key);

  final List<Movie> movies;

  @override
  _MoviesGridPageState createState() => new _MoviesGridPageState();
}

class _MoviesGridPageState extends State<MoviesGridPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    return new Theme(
      data: _kTheme.copyWith(platform: Theme
          .of(context)
          .platform),
      child: new Scaffold(
        key: scaffoldKey,
        body: new CustomScrollView(
          slivers: <Widget>[
            _buildAppBar(context, statusBarHeight),
            _buildBody(context, statusBarHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, double statusBarHeight) {
    return new SliverAppBar(
        pinned: true,
        expandedHeight: _kAppBarHeight,
        flexibleSpace: new LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return new Image.asset(
                  'assets/death_star_image.jpg', fit: BoxFit.cover);
            })
    );
  }

  Widget _buildBody(BuildContext context, double statusBarHeight) {
    final EdgeInsets mediaPadding = MediaQuery
        .of(context)
        .padding;
    final EdgeInsets padding = new EdgeInsets.only(
        top: 8.0,
        left: 8.0 + mediaPadding.left,
        right: 8.0 + mediaPadding.right,
        bottom: 8.0
    );
    return new SliverPadding(
      padding: padding,
      sliver: new SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _kMoviePageMaxWidth,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            final Movie movie = widget.movies[index];
            return new MovieCard(
              movie: movie,
              onTap: () {
                showMoviePage(context, movie);
              },
            );
          },
          childCount: widget.movies.length,
        ),
      ),
    );
  }

  void showMoviePage(BuildContext context, Movie movie) {
    Navigator.push(context,
        new MaterialPageRoute<void>(
          settings: const RouteSettings(name: '/movie'),
          builder:(BuildContext context) {
            return new Theme(
              data: _kTheme.copyWith(
                platform: Theme.of(context).platform
              ),
              child: new MovieDetailsPage(movie)
            );
          }
        )
    );
  }
}