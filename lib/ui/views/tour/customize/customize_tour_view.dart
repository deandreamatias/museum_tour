import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/constants.dart';
import '../../../widgets/chip_custom.dart';
import '../../../widgets/top_app_bar.dart';
import 'customize_tour_viewmodel.dart';

class CustomizeTourView extends StatelessWidget {
  const CustomizeTourView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: CustomColor.BACKGROUND,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Stack(
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
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: TopAppBar(
                          title: 'Personalizar tu guía',
                          onPressed: () => model.navigateToHome(),
                          hasImageBackground: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Tu nombre',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('Idioma de textos e audios guía'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Wrap(
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          alignment: WrapAlignment.start,
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
                              title: 'Français',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text('Tamaño de los textos'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Wrap(
                          runAlignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          alignment: WrapAlignment.start,
                          spacing: 8.0,
                          children: <Widget>[
                            ChipCustom(
                              title: 'Pequeño (x0.75)',
                              selected: true,
                            ),
                            ChipCustom(
                              title: 'Médio',
                            ),
                            ChipCustom(
                              title: 'Grande (x1.5)',
                            ),
                            ChipCustom(
                              title: 'Extra grande (x2.0)',
                            ),
                          ],
                        ),
                      ),
                      CheckboxListTile(
                        value: false,
                        checkColor: CustomColor.TEXT_MEDIUM,
                        activeColor: CustomColor.ACCENT,
                        onChanged: (bool value) {},
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                          'Reproducir audios guía automáticamente. (Necesario auriculares)',
                        ),
                      ),
                      SizedBox(height: 40.0)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FloatingActionButton.extended(
                    onPressed: () async =>
                        await model.navigateToExpositionTour(),
                    icon: Icon(
                      Icons.navigation,
                      color: CustomColor.TEXT_HIGH,
                    ),
                    backgroundColor: CustomColor.ACCENT,
                    label: Text(
                      'IR A EXPOSICIÓN',
                      style: TextStyle(
                        color: CustomColor.TEXT_HIGH,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                        'Estos datos no son usados para ningún fin fuera de la app de este dispositivo'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => CustomizeTourViewModel(),
    );
  }
}
