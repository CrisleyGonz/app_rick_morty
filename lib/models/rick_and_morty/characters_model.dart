import 'package:work_test/models/models.dart';

class CharactersModel {
  InformationModel? info;
  List<CharacterModel>? results;

  CharactersModel({
    this.info,
    this.results,
  });

  factory CharactersModel.fromJson(Map<String, dynamic> json) =>
      CharactersModel(
        info: json["info"] == null
            ? null
            : InformationModel.fromJson(json["info"]),
        results: json["results"] == null
            ? []
            : List<CharacterModel>.from(
                json["results"]!.map((x) => CharacterModel.fromJson(x))),
      );
}

class CharacterModel {
  int? id;
  String? name;
  Status? status;
  String? species;
  String? type;
  Gender? gender;
  CharacterLocationModel? origin;
  CharacterLocationModel? location;
  String? image;
  List<String>? episode;
  String? url;
  DateTime? created;

  CharacterModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"],
        name: json["name"],
        status: statusValues.map[json["status"]],
        species: json["species"],
        type: json["type"],
        gender: genderValues.map[json["gender"]],
        origin: json["origin"] == null
            ? null
            : CharacterLocationModel.fromJson(json["origin"]),
        location: json["location"] == null
            ? null
            : CharacterLocationModel.fromJson(json["location"]),
        image: json["image"],
        episode: json["episode"] == null
            ? []
            : List<String>.from(json["episode"]!.map((x) => x)),
        url: json["url"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
      );
}
