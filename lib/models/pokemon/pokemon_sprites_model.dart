class PokemonSprites {
  OtherModel? other;

  PokemonSprites({this.other});

  factory PokemonSprites.fromJson(Map<String, dynamic> json) => PokemonSprites(
        other:
            json["other"] == null ? null : OtherModel.fromJson(json["other"]),
      );
}

class OtherModel {
  OfficialArtworkModel? officialArtwork;

  OtherModel({this.officialArtwork});

  factory OtherModel.fromJson(Map<String, dynamic> json) => OtherModel(
        officialArtwork: json["official-artwork"] == null
            ? null
            : OfficialArtworkModel.fromJson(json["official-artwork"]),
      );
}

class OfficialArtworkModel {
  String? frontDefault;
  String? frontShiny;

  OfficialArtworkModel({this.frontDefault, this.frontShiny});

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> json) =>
      OfficialArtworkModel(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );
}
