import 'package:flutter/material.dart';
import 'package:museum_tour/ui/widgets/top_app_bar.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants.dart';
import '../../widgets/button_grid.dart';
import 'museum_details_viewmodel.dart';

class MuseumDetailsView extends StatefulWidget {
  const MuseumDetailsView({Key key}) : super(key: key);

  @override
  _MuseumDetailsViewState createState() => _MuseumDetailsViewState();
}

class _MuseumDetailsViewState extends State<MuseumDetailsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          color: CustomColor.BACKGROUND,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 3,
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
                          image: const AssetImage(Assets.INFO_MUSEUM),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: TopAppBar(
                        title: 'Museo de América',
                        onPressed: () => model.navigateToHome(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FloatingActionButton.extended(
                        onPressed: () async => await model.openMap(),
                        icon: Icon(
                          Icons.map,
                          color: CustomColor.TEXT_HIGH,
                        ),
                        backgroundColor: CustomColor.ACCENT,
                        label: Text(
                          'COMO LLEGAR',
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
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonGrid(
                          title: 'Horarios',
                        ),
                        ButtonGrid(
                          title: 'Tarifas',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonGrid(
                          title: 'Contacto',
                        ),
                        ButtonGrid(
                          title: 'Plano del museo',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => MuseumDetailsViewModel(),
    );
  }
}
