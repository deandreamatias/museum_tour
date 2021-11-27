import 'museum.dart';

class Museums {
  Museums({
    required this.id,
    required this.update,
    required this.items,
  });

  final String id;
  final String update;
  final List<Museum> items;
}
