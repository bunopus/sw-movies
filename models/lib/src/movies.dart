import 'package:json_annotation/json_annotation.dart';
import 'package:models/models.dart';
part 'movies.g.dart';

@JsonSerializable()
class Movies {
  List<Movie> movies;

  Movies(this.movies);

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesToJson(this);

}