import 'dart:convert';

class Museums {
  Museums({
    required this.id,
    required this.update,
    required this.items,
  });

  final String id;
  final String update;
  final List<Museum> items;

  factory Museums.fromRawJson(String str) => Museums.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Museums.fromJson(Map<String, dynamic> json) => Museums(
        id: json["id"],
        update: json["update"],
        items: List<Museum>.from(json["items"].map((x) => Museum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "update": update,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Museum {
  Museum({
    required this.id,
    required this.name,
    required this.telephone,
    required this.email,
    required this.websiteLink,
    required this.mapsLink,
    required this.province,
    required this.price,
    required this.schedules,
  });

  final int id;
  final String name;
  final String telephone;
  final String email;
  final String websiteLink;
  final String mapsLink;
  final String province;
  final String price;
  final String schedules;

  factory Museum.fromRawJson(String str) => Museum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Museum.fromJson(Map<String, dynamic> json) => Museum(
        id: json["id"],
        name: json["name"],
        telephone: json["telephone"],
        email: json["email"],
        websiteLink: json["website_link"],
        mapsLink: json["maps_link"],
        province: json["province"],
        price: json["price"],
        schedules: json["Schedules"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "telephone": telephone,
        "email": email,
        "website_link": websiteLink,
        "maps_link": mapsLink,
        "province": province,
        "price": price,
        "Schedules": schedules,
      };
}
