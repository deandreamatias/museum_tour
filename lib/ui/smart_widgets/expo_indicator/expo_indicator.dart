import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants.dart';
import 'expo_indicator_viewmodel.dart';

class ExpoIndicator extends StatelessWidget {
  const ExpoIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExpoIndicatorViewModel>.reactive(
      onModelReady: (ExpoIndicatorViewModel model) async =>
          await model.getExpoItem(),
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: model.isBusy
            ? Container()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  AnimatedSmoothIndicator(
                    activeIndex: model.indicator,
                    count: model.lengthItem,
                    effect: ScrollingDotsEffect(
                      activeDotColor: CustomColor.ACCENT,
                      dotColor: CustomColor.ACCENT.withOpacity(0.6),
                      spacing: 16.0,
                      maxVisibleDots: 7,
                    ),
                    onDotClicked: (updateIndex) {},
                  ),
                  Text('${model.indicator}/${model.lengthIndicator}'),
                ],
              ),
      ),
      viewModelBuilder: () => ExpoIndicatorViewModel(),
    );
  }
}
