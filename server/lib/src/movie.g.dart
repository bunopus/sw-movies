// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => new Movie(
    json['title'] as String,
    json['episodeNumber'] == null
        ? null
        : intFromString(json['episodeNumber'] as String),
    (json['mainCharacters'] as List)?.map((dynamic e) => e as String)?.toList(),
    json['description'] as String,
    json['poster'] as String,
    json['heroImage'] as String);

abstract class _$MovieSerializerMixin {
  String get title;
  int get episodeNumber;
  List<String> get mainCharacters;
  String get description;
  String get poster;
  String get heroImage;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'episodeNumber': episodeNumber,
        'mainCharacters': mainCharacters,
        'description': description,
        'poster': poster,
        'heroImage': heroImage
      };
}
