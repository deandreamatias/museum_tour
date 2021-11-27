import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/museums.dart';
import 'museum_model.dart';

part 'museums_model.g.dart';

@JsonSerializable()
class MuseumsModel extends Museums {
  MuseumsModel({
    required String id,
    required String update,
    required this.items,
  }) : super(
          id: id,
          items: items,
          update: update,
        );
  final List<MuseumModel> items;

  factory MuseumsModel.fromJson(Map<String, dynamic> json) =>
      _$MuseumsModelFromJson(json);
  Map<String, dynamic> toJson() => _$MuseumsModelToJson(this);
}
