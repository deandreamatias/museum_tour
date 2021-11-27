import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stacked/stacked.dart';

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
                                        textCapitalization:
                                            TextCapitalization.words,
                                        controller: model.textEditingController,
                                        decoration: const InputDecoration(
                                          labelText: 'Tu nombre',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(
                                          'Idioma de textos y audios guía'),
                                    ),
                                    model.isBusy
                                        ? const CircularProgressIndicator()
                                        : Wrap(
                                            children: [
                                              ...model.listLanguages
                                                  .map(
                                                    (item) => ChoiceChip(
                                                      label: Text(item),
                                                      onSelected: (value) => {},
                                                      selected: false,
                                                    ),
                                                  )
                                                  .toList()
                                            ],
                                          ),
                                    const SizedBox(height: 16.0),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
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
                                          ChoiceChip(
                                            label:
                                                const Text('Pequeño (x0.75)'),
                                            onSelected: (value) => {},
                                            selected: false,
                                          ),
                                          ChoiceChip(
                                            label: const Text('Médio'),
                                            onSelected: (value) => {},
                                            selected: true,
                                          ),
                                          ChoiceChip(
                                            label: const Text('Grande (x1.5)'),
                                            onSelected: (value) => {},
                                            selected: false,
                                          ),
                                          ChoiceChip(
                                            label: const Text(
                                                'Extra grande (x2.0)'),
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
                                      title: const Text(
                                        'Reproducir audios guía automáticamente. (Necesario auriculares)',
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
                                  label: const Text('IR A EXPOSICIÓN'),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: const <Widget>[
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
