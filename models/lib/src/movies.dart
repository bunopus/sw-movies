import 'package:json_annotation/json_annotation.dart';
import 'package:models/src/movie.dart';

part 'movies.g.dart';

@JsonSerializable()
class Movies extends Object with _$MoviesSerializerMixin {

  @JsonKey()
  List<Movie> movies;

  Movies(this.movies);

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
}