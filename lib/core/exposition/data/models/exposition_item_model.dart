import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/exposition_item.dart';

part 'exposition_item_model.g.dart';

@JsonSerializable()
class ExpositionItemModel extends ExpositionItem {
  ExpositionItemModel({
    required int id,
    required String name,
    required String date,
    required String technique,
    required String locale,
    required String description,
  }) : super(
          date: date,
          description: description,
          id: id,
          locale: locale,
          name: name,
          technique: technique,
        );

  factory ExpositionItemModel.fromJson(Map<String, dynamic> json) =>
      _$ExpositionItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExpositionItemModelToJson(this);
}
