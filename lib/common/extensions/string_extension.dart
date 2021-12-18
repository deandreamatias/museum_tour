import 'package:intl/intl.dart';

extension StringExtension on String {
  String toSentenceCase() => toBeginningOfSentenceCase(this) ?? this;

  String addTwoDots(String details) => this + ': ' + details;
}
