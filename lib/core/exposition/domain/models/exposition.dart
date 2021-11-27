import 'package:museum_tour/core/exposition/domain/models/exposition_item.dart';

class Exposition {
  Exposition({
    required this.id,
    required this.update,
    required this.items,
  });

  final String id;
  final String update;
  final List<ExpositionItem> items;
}
