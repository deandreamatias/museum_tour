import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:museum_tour/ui/smart_widgets/expo_indicator/expo_indicator.dart';
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
      builder: (context, CustomizeTourViewModel model, child) => WillPopScope(
        onWillPop: model.resetTour,
        child: Scaffold(
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
                                    TopAppBar(
                                      title: 'Personalizar tu guía',
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
                                        textCapitalization: TextCapitalization.words,
                                        controller: model.textEditingController,
                                        decoration: InputDecoration(
                                          labelText: 'Tu nombre',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(
                                          'Idioma de textos e audios guía'),
                                    ),
                                    model.isBusy
                                        ? CircularProgressIndicator()
                                        : ChipsChoice<int>.single(
                                            value: model.indexLanguage,
                                            options: ChipsChoiceOption.listFrom<
                                                int, String>(
                                              source: model.listLanguages,
                                              value: (i, v) => i,
                                              label: (i, v) => v,
                                            ),
                                            itemBuilder:
                                                (item, selected, select) =>
                                                    ChipCustom(
                                              selected: selected,
                                              title: item.label,
                                              onSelected: select,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            onChanged: (val) =>
                                                model.setLanguage(val),
                                            isWrapped: true,
                                          ),
                                    const SizedBox(height: 16.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text('Tamaño de los textos'),
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
                                    const SizedBox(height: 16.0),
                                    CheckboxListTile(
                                      value: false,
                                      checkColor: CustomColor.TEXT_MEDIUM,
                                      activeColor: CustomColor.ACCENT,
                                      onChanged: (bool value) {},
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      title: Text(
                                        'Reproducir audios guía automáticamente. (Necesario auriculares)',
                                      ),
                                    ),
                                    SizedBox(height: 32.0)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: FloatingActionButton.extended(
                                  onPressed: () async =>
                                      await model.navigateToExpositionTour(),
                                  icon: Icon(
                                    FeatherIcons.navigation2,
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
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Estos datos no son usados para ningún fin fuera de la app de este dispositivo',
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 40.0),
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
                  ExpoIndicator()
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
