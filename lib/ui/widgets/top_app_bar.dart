import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    this.onPressed,
    required this.title,
    this.hasImageBackground = true,
    Key? key,
  }) : super(key: key);

  final String title;
  final Function()? onPressed;
  final bool hasImageBackground;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: hasImageBackground
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.onSurface,
                  Colors.transparent
                ],
              )
            : null,
      ),
      height: 72.0,
      child: SafeArea(
        child: AppBar(
          leading: onPressed != null
              ? IconButton(
                  icon: const Icon(FeatherIcons.home),
                  onPressed: () async => await onPressed!(),
                  color: hasImageBackground
                      ? Theme.of(context).colorScheme.surface
                      : Theme.of(context).colorScheme.onSurface,
                )
              : null,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            title,
            style: TextStyle(
              color: hasImageBackground
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
      ),
    );
  }
}
