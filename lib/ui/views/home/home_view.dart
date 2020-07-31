import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants.dart';
import '../../widgets/button_grid.dart';
import '../../widgets/chip_custom.dart';
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
        body: Container(
          color: CustomColor.BACKGROUND,
          child: Column(
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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FloatingActionButton.extended(
                        onPressed: null,
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
                    ),
                    ButtonGrid(
                      title: 'Otros museos',
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
                    ),
                    ChipCustom(
                      title: 'English',
                    ),
                    ChipCustom(
                      title: 'Português',
                    ),
                    ChipCustom(
                      title: 'Italiano',
                    ),
                    ChipCustom(
                      title: 'Française',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
