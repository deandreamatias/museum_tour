import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/museum.dart';

part 'museum_model.g.dart';

@JsonSerializable()
class MuseumModel extends Museum {
  @override
  @JsonKey(name: 'website_link')
  final String websiteLink;
  @override
  @JsonKey(name: 'maps_link')
  final String mapsLink;
  MuseumModel({
    required this.websiteLink,
    required this.mapsLink,
    required int id,
    required String name,
    required String telephone,
    required String email,
    required String province,
    required String price,
    required String schedules,
  }) : super(
          email: email,
          id: id,
          mapsLink: mapsLink,
          name: name,
          price: price,
          province: province,
          schedules: schedules,
          telephone: telephone,
          websiteLink: websiteLink,
        );

  factory MuseumModel.fromJson(Map<String, dynamic> json) =>
      _$MuseumModelFromJson(json);
  Map<String, dynamic> toJson() => _$MuseumModelToJson(this);
}
