// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
      json['title'] as String,
      json['episodeNumber'] == null
          ? null
          : intFromString(json['episodeNumber'] as String),
      (json['mainCharacters'] as List)?.map((e) => e as String)?.toList(),
      json['description'] as String,
      json['poster'] as String,
      json['heroImage'] as String);
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'episodeNumber': instance.episodeNumber,
      'mainCharacters': instance.mainCharacters,
      'description': instance.description,
      'poster': instance.poster,
      'heroImage': instance.heroImage
    };
