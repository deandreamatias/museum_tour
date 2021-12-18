import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/constants.dart';
import '../../../../common/common.dart';
import '../../../../generated/l10n.dart';
import '../../../widgets/expo_indicator.dart';
import '../../../widgets/top_app_bar.dart';
import 'exposition_tour_viewmodel.dart';

class ExpositionTourView extends StatelessWidget {
  const ExpositionTourView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, ExpositionTourViewModel model, child) => Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            height: constraints.maxHeight,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: constraints.maxHeight * 3 / 4,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(bottom: 40.0),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(32.0),
                                    bottomLeft: Radius.circular(32.0),
                                  ),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(Assets.sculpture),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: TopAppBar(
                                  title: model.item.name.toSentenceCase(),
                                  onPressed: () => model.navigateToHome(),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SizedBox(
                                    height: 48.0,
                                    width: 56.0,
                                    child: ElevatedButton(
                                      child: const Icon(FeatherIcons.skipBack),
                                      onPressed: () => model.backExpo(),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: FloatingActionButton.extended(
                                  heroTag: 'fab',
                                  onPressed: () async =>
                                      await model.continueExpo(),
                                  icon: const Icon(FeatherIcons.skipForward),
                                  label: Text(
                                      S.of(context).btnContinue.toUpperCase()),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: model.isBusy
                              ? const CircularProgressIndicator()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(S
                                                  .of(context)
                                                  .dating
                                                  .addTwoDots(model.item.date)
                                                  .toSentenceCase()),
                                              const SizedBox(height: 4),
                                              Text(S
                                                  .of(context)
                                                  .technique
                                                  .addTwoDots(
                                                      model.item.technique)
                                                  .toSentenceCase()),
                                              const SizedBox(height: 4),
                                              Text(S
                                                  .of(context)
                                                  .placeOfOrigin
                                                  .addTwoDots(model.item.locale)
                                                  .toSentenceCase()),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Text(S
                                                .of(context)
                                                .audioGuide
                                                .toSentenceCase()),
                                            const SizedBox(height: 4),
                                            SizedBox(
                                              height: 40.0,
                                              width: 56.0,
                                              child: ElevatedButton(
                                                child: const Icon(
                                                    FeatherIcons.playCircle),
                                                onPressed: () {},
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      S
                                          .of(context)
                                          .description
                                          .addTwoDots(model.item.description)
                                          .toSentenceCase(),
                                    ),
                                    const SizedBox(height: 56),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 56,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Theme.of(context).colorScheme.surface,
                        Theme.of(context).colorScheme.surface.withOpacity(0.1)
                      ],
                    ),
                  ),
                ),
                ExpoIndicator(
                  indicator: model.indicator,
                  lengthIndicator: model.lengthIndicator,
                  lengthItem: model.lengthItem,
                  onDotTap: (index) => model.jumpTo(index),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ExpositionTourViewModel(),
    );
  }
}
