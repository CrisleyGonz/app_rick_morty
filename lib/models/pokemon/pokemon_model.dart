import 'package:work_test/models/pokemon/pokemon.dart';

class PokemonModel {
  int? height;
  int? id;
  String? name;
  int? order;
  PokemonSprites? sprites;
  List<PokemonTypeModel>? types;
  int? weight;

  PokemonModel({
    this.height,
    this.id,
    this.name,
    this.order,
    this.sprites,
    this.types,
    this.weight,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        height: json["height"],
        id: json["id"],
        name: json["name"],
        order: json["order"],
        sprites: json["sprites"] == null
            ? null
            : PokemonSprites.fromJson(json["sprites"]),
        types: json["types"] == null
            ? []
            : List<PokemonTypeModel>.from(
                json["types"]!.map((x) => PokemonTypeModel.fromJson(x))),
        weight: json["weight"],
      );
}
