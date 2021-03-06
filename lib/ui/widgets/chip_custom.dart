import 'package:flutter/material.dart';

import '../../app/constants.dart';

class ChipCustom extends StatelessWidget {
  const ChipCustom({
    this.title,
    this.selected = false,
    this.backgroundColor = Colors.white,
    this.onSelected,
    Key key,
  }) : super(key: key);
  final String title;
  final bool selected;
  final Color backgroundColor;
  final Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        title,
        style: TextStyle(color: CustomColor.TEXT_MEDIUM),
      ),
      onSelected: onSelected,
      selected: selected,
      showCheckmark: false,
      backgroundColor: backgroundColor,
      selectedColor: CustomColor.ACCENT.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
        side: BorderSide(
          color: selected ? Colors.transparent : CustomColor.ACCENT,
        ),
      ),
    );
  }
}
