import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:museum_tour/app/constants.dart';
import 'package:museum_tour/ui/widgets/top_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'exposition_tour_viewmodel.dart';

class ExpositionTourView extends StatelessWidget {
  const ExpositionTourView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: CustomColor.BACKGROUND,
        body: Container(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    height: constraints.maxHeight * 3 / 4,
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
                            color: Colors.white,
                            image: const DecorationImage(
                              image: AssetImage(Assets.SCULPTURE),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: TopAppBar(
                            title: 'Chalchuhtlicue',
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
                              child: RaisedButton(
                                child: Icon(FeatherIcons.skipBack),
                                color: CustomColor.BACKGROUND,
                                onPressed: () => model.navigateBack(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  side: BorderSide(
                                    color: CustomColor.ACCENT,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: FloatingActionButton.extended(
                            heroTag: 'fab',
                            onPressed: () async =>
                                await model.navigateToFinishTour(),
                            icon: Icon(
                              FeatherIcons.skipForward,
                              color: CustomColor.TEXT_HIGH,
                            ),
                            backgroundColor: CustomColor.ACCENT,
                            label: Text(
                              'CONTINUAR',
                              style: TextStyle(
                                color: CustomColor.TEXT_HIGH,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Datación: 1400 - 1520'),
                                  SizedBox(height: 4),
                                  Text('Técnica: Picado. Pulido.'),
                                  SizedBox(height: 4),
                                  Text('Lugar de procedencia: México'),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text('Audio guía'),
                                SizedBox(height: 4),
                                SizedBox(
                                  height: 40.0,
                                  width: 56.0,
                                  child: RaisedButton(
                                    child: Icon(FeatherIcons.playCircle),
                                    color: Colors.white,
                                    onPressed: () {},
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                      side: BorderSide(
                                        color: CustomColor.ACCENT,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Descripción: Figura escultórica femenina arrodillada sentada sobre sus talones y con las dos manos sobre las rodillas. Lleva un tocado debajo del cual se aprecian los bordes del flequillo y del que penden una serie de discos. Su tocado consiste en varias bandas anchas, lleva falda y camisa femenina en pico, adornada con borlas colgantes.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ExpositionTourViewModel(),
    );
  }
}
