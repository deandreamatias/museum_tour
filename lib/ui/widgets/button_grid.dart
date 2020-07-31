import 'package:flutter/material.dart';

import '../../app/constants.dart';

class ButtonGrid extends StatelessWidget {
  ButtonGrid({
    this.title,
    Key key,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 120.0,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 18,
            color: CustomColor.TEXT_MEDIUM,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.0),
        color: Colors.white,
        border: Border.all(width: 1.0, color: CustomColor.ACCENT),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 0),
            blurRadius: 8,
          ),
        ],
      ),
    );
  }
}
