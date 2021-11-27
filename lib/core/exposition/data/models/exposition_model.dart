import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/exposition.dart';
import 'exposition_item_model.dart';

part 'exposition_model.g.dart';

@JsonSerializable()
class ExpositionModel extends Exposition {
  ExpositionModel({
    required String id,
    required String update,
    required List<ExpositionItemModel> items,
  }) : super(
          id: id,
          items: items,
          update: update,
        );

  factory ExpositionModel.fromJson(Map<String, dynamic> json) =>
      _$ExpositionModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExpositionModelToJson(this);
}
