// ignore_for_file: overridden_fields

import 'package:json_annotation/json_annotation.dart';
import '../../domain/models/exposition.dart';

import 'exposition_item_model.dart';

part 'exposition_model.g.dart';

@JsonSerializable()
class ExpositionModel extends Exposition {
  @override
  final List<ExpositionItemModel> items;

  ExpositionModel({
    required String id,
    required String update,
    required this.items,
  }) : super(
          id: id,
          items: items,
          update: update,
        );

  factory ExpositionModel.fromJson(Map<String, dynamic> json) =>
      _$ExpositionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExpositionModelToJson(this);
}
