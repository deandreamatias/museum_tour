import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants.dart';
import '../../widgets/button_grid.dart';
import '../../widgets/chip_custom.dart';
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
        backgroundColor: CustomColor.background,
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
                  const Align(
                    alignment: Alignment.topCenter,
                    child: TopAppBar(
                      title: 'Exposición',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton.extended(
                      onPressed: () async =>
                          await model.navigateToCustomizeTour(),
                      icon: const Icon(
                        FeatherIcons.navigation,
                        color: CustomColor.textHigh,
                      ),
                      backgroundColor: CustomColor.accent,
                      label: const Text(
                        'INICIAR',
                        style: TextStyle(
                          color: CustomColor.textHigh,
                        ),
                      ),
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
                    title: 'Información del museo',
                    onPressed: () async =>
                        await model.navigateToMuseumDetails(),
                  ),
                  ButtonGrid(
                    title: 'Otros museos',
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
                        children: [
                          ...model.listLanguages
                              .map(
                                (item) => ChipCustom(
                                  selected: false,
                                  title: item,
                                  onSelected: (value) =>
                                      value ? model.saveLanguage(item) : null,
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
