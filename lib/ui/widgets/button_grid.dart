import 'package:flutter/material.dart';

class ButtonGrid extends StatelessWidget {
  const ButtonGrid({
    required this.title,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(32.0),
      onTap: onPressed,
      child: Container(
        height: 120.0,
        width: 120.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.0),
          color: Colors.white,
          border: Border.all(
            width: 1.0,
            color: Theme.of(context).colorScheme.primary,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 0),
              blurRadius: 8,
            ),
          ],
        ),
      ),
    );
  }
}
