import 'package:flutter/material.dart';
import 'package:museum_tour/app/constants.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    this.onPressed,
    this.title,
    Key key,
  }) : super(key: key);

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [CustomColor.TEXT_HIGH, Colors.transparent],
        ),
      ),
      height: 72.0,
      child: SafeArea(
        child: AppBar(
          leading: onPressed != null
              ? IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () async => await onPressed(),
                )
              : null,
          backgroundColor: Colors.transparent,
          title: Text(title),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
      ),
    );
  }
}
