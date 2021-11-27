import 'package:flutter/material.dart';

import '../../app/constants.dart';

class ChipCustom extends StatelessWidget {
  const ChipCustom({
    required this.title,
    this.selected = false,
    this.backgroundColor = Colors.white,
    this.onSelected,
    Key? key,
  }) : super(key: key);
  final String title;
  final bool selected;
  final Color backgroundColor;
  final Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        title,
        style: const TextStyle(color: CustomColor.textMedium),
      ),
      onSelected: onSelected,
      selected: selected,
      showCheckmark: false,
      backgroundColor: backgroundColor,
      selectedColor: CustomColor.accent.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
        side: BorderSide(
          color: selected ? Colors.transparent : CustomColor.accent,
        ),
      ),
    );
  }
}
