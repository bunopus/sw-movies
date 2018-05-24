// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) => new Movies((json['movies']
        as List)
    ?.map(
        (e) => e == null ? null : new Movie.fromJson(e as Map<String, dynamic>))
    ?.toList());

abstract class _$MoviesSerializerMixin {
  List<Movie> get movies;
  Map<String, dynamic> toJson() => <String, dynamic>{'movies': movies};
}
