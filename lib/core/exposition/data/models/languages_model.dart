import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/languages.dart';

part 'languages_model.g.dart';

@JsonSerializable()
class LanguagesModel extends Languages {
  LanguagesModel({List<String> languages = const []});

  factory LanguagesModel.fromJson(Map<String, dynamic> json) =>
      _$LanguagesModelFromJson(json);
  Map<String, dynamic> toJson() => _$LanguagesModelToJson(this);
}
