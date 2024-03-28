class CharacterLocationModel {
  String? name;
  String? url;

  CharacterLocationModel({this.name, this.url});

  factory CharacterLocationModel.fromJson(Map<String, dynamic> json) =>
      CharacterLocationModel(
        name: json["name"],
        url: json["url"],
      );
}
