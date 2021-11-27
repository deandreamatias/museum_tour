class Settings {
  final String name;
  final String language;
  final bool autoplay;

  Settings({
    this.name = '',
    required this.language,
    this.autoplay = false,
  });
}
