import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:museum_tour/app/constants.dart';
import 'package:museum_tour/ui/smart_widgets/expo_indicator/expo_indicator.dart';
import 'package:museum_tour/ui/widgets/top_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'exposition_tour_viewmodel.dart';

class ExpositionTourView extends StatelessWidget {
  const ExpositionTourView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, ExpositionTourViewModel model, child) => Scaffold(
        backgroundColor: CustomColor.BACKGROUND,
        body: LayoutBuilder(
          builder: (context, constraints) => Container(
            height: constraints.maxHeight,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
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
                                  title: model.item?.name ?? 'Cargando',
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
                                      onPressed: () => model.backExpo(),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
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
                                      await model.continueExpo(),
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
                          child: model.isBusy
                              ? CircularProgressIndicator()
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
                                              Text(
                                                  'Datación: ${model.item.date}'),
                                              SizedBox(height: 4),
                                              Text(
                                                  'Técnica: ${model.item.technique}'),
                                              SizedBox(height: 4),
                                              Text(
                                                  'Lugar de procedencia: ${model.item.locale}'),
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
                                                child: Icon(
                                                    FeatherIcons.playCircle),
                                                color: Colors.white,
                                                onPressed: () {},
                                                elevation: 0.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          32.0),
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
                                      'Descripción: ${model.item.description}',
                                    ),
                                    SizedBox(height: 56),
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
                        CustomColor.BACKGROUND,
                        CustomColor.BACKGROUND.withOpacity(0.1)
                      ],
                    ),
                  ),
                ),
                ExpoIndicator(),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ExpositionTourViewModel(),
    );
  }
}
