import 'package:flutter/material.dart';

import '../../app/constants.dart';

class ChipCustom extends StatelessWidget {
  const ChipCustom({
    this.title,
    this.selected = false,
    Key key,
  }) : super(key: key);
  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(
        title,
        style: TextStyle(color: CustomColor.TEXT_MEDIUM),
      ),
      onSelected: (bool) {},
      selected: selected,
      showCheckmark: false,
      backgroundColor: CustomColor.BACKGROUND,
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
