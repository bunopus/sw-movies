// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => new Movie(
    json['title'] as String,
    json['episode_number'] == null ? null : intFromAny(json['episode_number']),
    (json['main_characters'] as List)?.map((e) => e as String)?.toList(),
    json['description'] as String,
    json['poster'] as String,
    json['hero_image'] as String);

abstract class _$MovieSerializerMixin {
  String get title;
  int get episodeNumber;
  List<String> get mainCharacters;
  String get description;
  String get poster;
  String get heroImage;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'episode_number': episodeNumber,
        'main_characters': mainCharacters,
        'description': description,
        'poster': poster,
        'hero_image': heroImage
      };
}
