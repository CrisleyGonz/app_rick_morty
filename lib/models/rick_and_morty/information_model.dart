class InformationModel {
  int? count;
  int? pages;
  String? next;
  String? prev;

  InformationModel({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  factory InformationModel.fromJson(Map<String, dynamic> json) =>
      InformationModel(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );
}
