import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants.dart';
import '../../../common/common.dart';
import '../../../generated/l10n.dart';
import '../../widgets/button_grid.dart';
import '../../widgets/top_app_bar.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, HomeViewModel model, child) => Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 4,
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
                      image: DecorationImage(
                        image: AssetImage(Assets.expoMuseum),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: TopAppBar(
                      title: S.of(context).exposition.toSentenceCase(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton.extended(
                      onPressed: () async =>
                          await model.navigateToCustomizeTour(),
                      icon: const Icon(
                        FeatherIcons.navigation,
                      ),
                      label: Text(S.of(context).btnStart.toUpperCase()),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonGrid(
                    title: S.of(context).infoMuseum.toSentenceCase(),
                    onPressed: () async =>
                        await model.navigateToMuseumDetails(),
                  ),
                  ButtonGrid(
                    title: S.of(context).otherMuseums.toSentenceCase(),
                    onPressed: () async => await model.navigateToOtherMuseums(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: model.isBusy
                    ? const CircularProgressIndicator()
                    : Wrap(
                        spacing: 8,
                        alignment: WrapAlignment.center,
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
              ),
            ),
          ],
        ),
      ),
      onModelReady: (HomeViewModel model) => model.initialLoad(),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
