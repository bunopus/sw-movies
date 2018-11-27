import 'package:json_annotation/json_annotation.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie {
  String title;

  @JsonKey(fromJson: intFromString)
  int episodeNumber;

  List<String> mainCharacters;
  String description;
  String poster;
  String heroImage;

  Movie(this.title, this.episodeNumber, this.mainCharacters,
      this.description, this.poster, this.heroImage);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

}

int intFromString(String val) {
  return int.parse(val, radix: 10);
}