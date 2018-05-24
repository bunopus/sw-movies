import 'package:json_annotation/json_annotation.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie extends Object with _$MovieSerializerMixin {
  String title;

  @JsonKey(fromJson: intFromString, name:'episode_number')
  int episodeNumber;

  @JsonKey(name:'main_characters')
  List<String> mainCharacters;

  String description;
  String poster;

  @JsonKey(name:'hero_image')
  String heroImage;

  Movie(this.title, this.episodeNumber, this.mainCharacters,
      this.description, this.poster, this.heroImage);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}

int intFromString(String val) {
  return int.parse(val, radix: 10);
}