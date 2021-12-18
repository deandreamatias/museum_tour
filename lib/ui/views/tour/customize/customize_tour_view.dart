import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stacked/stacked.dart';

import '../../../../common/common.dart';
import '../../../../generated/l10n.dart';
import '../../../smart_widgets/expo_indicator/expo_indicator.dart';
import '../../../widgets/top_app_bar.dart';
import 'customize_tour_viewmodel.dart';

class CustomizeTourView extends StatelessWidget {
  const CustomizeTourView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, CustomizeTourViewModel model, child) => WillPopScope(
        onWillPop: model.resetTour,
        child: Scaffold(
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
                          Stack(
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
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    TopAppBar(
                                      title: S
                                          .of(context)
                                          .customizeYourGuide
                                          .toSentenceCase(),
                                      onPressed: () => model.navigateToHome(),
                                      hasImageBackground: false,
                                    ),
                                    const SizedBox(height: 16.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: TextField(
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.done,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        controller: model.textEditingController,
                                        decoration: InputDecoration(
                                          labelText: S
                                              .of(context)
                                              .yourName
                                              .toSentenceCase(),
                                          border: const OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(S
                                          .of(context)
                                          .languageSelect
                                          .toSentenceCase()),
                                    ),
                                    model.isBusy
                                        ? const CircularProgressIndicator()
                                        : Wrap(
                                            children: [
                                              ...model.listLanguages
                                                  .map(
                                                    (item) => ChoiceChip(
                                                      label: Text(S
                                                          .of(context)
                                                          .languages(item)
                                                          .toSentenceCase()),
                                                      onSelected: (value) => {},
                                                      selected: false,
                                                    ),
                                                  )
                                                  .toList()
                                            ],
                                          ),
                                    const SizedBox(height: 16.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(S
                                          .of(context)
                                          .textSizeSelect
                                          .toSentenceCase()),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Wrap(
                                        runAlignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        alignment: WrapAlignment.start,
                                        spacing: 8.0,
                                        children: <Widget>[
                                          ChoiceChip(
                                            label: Text(S
                                                .of(context)
                                                .textSizes(model.textSizes[0])),
                                            onSelected: (value) => {},
                                            selected: false,
                                          ),
                                          ChoiceChip(
                                            label: Text(S
                                                .of(context)
                                                .textSizes(model.textSizes[1])),
                                            onSelected: (value) => {},
                                            selected: true,
                                          ),
                                          ChoiceChip(
                                            label: Text(S
                                                .of(context)
                                                .textSizes(model.textSizes[2])),
                                            onSelected: (value) => {},
                                            selected: false,
                                          ),
                                          ChoiceChip(
                                            label: Text(S
                                                .of(context)
                                                .textSizes(model.textSizes[3])),
                                            onSelected: (value) => {},
                                            selected: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    CheckboxListTile(
                                      value: model.autoplay,
                                      onChanged: (bool? value) => {},
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text(
                                        S
                                            .of(context)
                                            .automaticPlaySelect
                                            .toSentenceCase(),
                                      ),
                                    ),
                                    const SizedBox(height: 32.0)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: FloatingActionButton.extended(
                                  onPressed: () async =>
                                      await model.navigateToExpositionTour(),
                                  icon: const Icon(FeatherIcons.navigation2),
                                  label: Text(S
                                      .of(context)
                                      .btnGoToExposition
                                      .toUpperCase()),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  S.of(context).dataSafeInfo.toSentenceCase(),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 40.0),
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
                          Theme.of(context).colorScheme.background,
                          Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(0.1)
                        ],
                      ),
                    ),
                  ),
                  const ExpoIndicator()
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => CustomizeTourViewModel(),
    );
  }
}
