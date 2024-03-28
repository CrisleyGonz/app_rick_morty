class PokemonTypeModel {
  int? slot;
  SpeciesModel? type;

  PokemonTypeModel({this.slot, this.type});

  factory PokemonTypeModel.fromJson(Map<String, dynamic> json) =>
      PokemonTypeModel(
        slot: json["slot"],
        type: json["type"] == null ? null : SpeciesModel.fromJson(json["type"]),
      );
}

class SpeciesModel {
  String? name;
  String? url;

  SpeciesModel({this.name, this.url});

  factory SpeciesModel.fromJson(Map<String, dynamic> json) => SpeciesModel(
        name: json["name"],
        url: json["url"],
      );
}
