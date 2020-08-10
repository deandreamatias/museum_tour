import 'dart:convert';

class Exposition {
  Exposition({
    this.id,
    this.update,
    this.items,
  });

  final String id;
  final String update;
  final List<Item> items;

  factory Exposition.fromRawJson(String str) =>
      Exposition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Exposition.fromJson(Map<String, dynamic> json) => Exposition(
        id: json["id"],
        update: json["update"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "update": update,
        "items": List<Item>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.name,
    this.date,
    this.technique,
    this.locale,
    this.description,
  });

  final int id;
  final String name;
  final String date;
  final String technique;
  final String locale;
  final String description;

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        date: json["date"],
        technique: json["technique"],
        locale: json["locale"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "date": date,
        "technique": technique,
        "locale": locale,
        "description": description,
      };
}
