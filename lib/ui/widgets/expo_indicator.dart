import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ExpoIndicator extends StatelessWidget {
  final int indicator;
  final int lengthItem;
  final int lengthIndicator;
  final void Function(int)? onDotTap;
  const ExpoIndicator({
    Key? key,
    required this.indicator,
    required this.lengthItem,
    required this.lengthIndicator,
    this.onDotTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AnimatedSmoothIndicator(
            activeIndex: indicator,
            count: lengthItem,
            effect: ScrollingDotsEffect(
              activeDotColor: Theme.of(context).colorScheme.primary,
              dotColor: Theme.of(context).colorScheme.primary.withOpacity(0.6),
              spacing: 16.0,
              maxVisibleDots: 7,
            ),
            onDotClicked: onDotTap,
          ),
          Text('$indicator/$lengthIndicator'),
        ],
      ),
    );
  }
}
