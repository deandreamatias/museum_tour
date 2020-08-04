import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants.dart';
import '../../widgets/button_grid.dart';
import '../../widgets/chip_custom.dart';
import '../../widgets/top_app_bar.dart';
import 'home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: CustomColor.BACKGROUND,
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(32.0),
                        bottomLeft: Radius.circular(32.0),
                      ),
                      image: DecorationImage(
                        image: const AssetImage(Assets.EXPO_MUSEUM),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: TopAppBar(
                      title: 'Exposición pre colombina',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton.extended(
                      onPressed: () async =>
                          await model.navigateToCustomizeTour(),
                      icon: Icon(
                        Icons.navigation,
                        color: CustomColor.TEXT_HIGH,
                      ),
                      backgroundColor: CustomColor.ACCENT,
                      label: Text(
                        'INICIAR',
                        style: TextStyle(
                          color: CustomColor.TEXT_HIGH,
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
              child: Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                spacing: 8.0,
                children: <Widget>[
                  ChipCustom(
                    title: 'Español',
                    selected: true,
                    backgroundColor: CustomColor.BACKGROUND,
                  ),
                  ChipCustom(
                    title: 'English',
                    backgroundColor: CustomColor.BACKGROUND,
                  ),
                  ChipCustom(
                    title: 'Português',
                    backgroundColor: CustomColor.BACKGROUND,
                  ),
                  ChipCustom(
                    title: 'Italiano',
                    backgroundColor: CustomColor.BACKGROUND,
                  ),
                  ChipCustom(
                    title: 'Français',
                    backgroundColor: CustomColor.BACKGROUND,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
