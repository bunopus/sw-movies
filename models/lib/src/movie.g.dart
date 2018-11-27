// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
      json['title'] as String,
      json['episode_number'] as int,
      (json['main_characters'] as List)?.map((dynamic e) => e as String)?.toList(),
      json['description'] as String,
      json['poster'] as String,
      json['hero_image'] as String);
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'episode_number': instance.episodeNumber,
      'main_characters': instance.mainCharacters,
      'description': instance.description,
      'poster': instance.poster,
      'hero_image': instance.heroImage
    };
