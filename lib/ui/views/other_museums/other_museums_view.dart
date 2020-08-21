import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants.dart';
import '../../../models/museums.dart';
import '../../widgets/chip_custom.dart';
import '../../widgets/top_app_bar.dart';
import 'other_museums_viewmodel.dart';

class OtherMuseumsView extends StatefulWidget {
  const OtherMuseumsView({Key key}) : super(key: key);

  @override
  _OtherMuseumsViewState createState() => _OtherMuseumsViewState();
}

class _OtherMuseumsViewState extends State<OtherMuseumsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (OtherMuseumsViewModel model) => model.loadMuseumsInfo(),
      builder: (context, OtherMuseumsViewModel model, child) => Scaffold(
        backgroundColor: CustomColor.BACKGROUND,
        body: LayoutBuilder(
          builder: (context, constraints) => Container(
            height: constraints.maxHeight,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TopAppBar(
                              title: 'Otros museos',
                              onPressed: () => model.navigateToHome(),
                              hasImageBackground: false,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                  'Seleccione otros museos en España para más detalles',
                                  style: Theme.of(context).textTheme.subtitle1,
                                  textAlign: TextAlign.center,
                                  ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: model.isBusy
                                  ? CircularProgressIndicator()
                                  : ChipsChoice<int>.single(
                                      wrapAlignment: WrapAlignment.center,
                                      value: model.index,
                                      options: ChipsChoiceOption.listFrom<int,
                                          Museum>(
                                        source: model.museums,
                                        value: (i, v) => i,
                                        label: (i, v) => v.name,
                                      ),
                                      itemBuilder: (item, selected, select) =>
                                          ChipCustom(
                                        selected: selected,
                                        title: item.label,
                                        onSelected: select,
                                      ),
                                      onChanged: (val) => model.setMuseum(val),
                                      isWrapped: true,
                                    ),
                            ),
                            SizedBox(height: 32.0)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FloatingActionButton.extended(
                          onPressed: () async => await model.openLink(),
                          icon: Icon(
                            FeatherIcons.map,
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
                  Container(
                    width: constraints.maxWidth,
                    padding: const EdgeInsets.all(16.0),
                    child: model.isBusy
                        ? CircularProgressIndicator()
                        : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Teléfono: ${model.museumSelected.telephone}',
                              ),
                              Text(
                                'Sitio web',
                              ),
                              Text(
                                'Provincia: ${model.museumSelected.province}',
                              ),
                              Text(
                                'Tarifas: ${model.museumSelected.price}',
                              ),
                              Text(
                                'Horarios: ${model.museumSelected.schedules}',
                              ),
                              SizedBox(height: 40.0),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => OtherMuseumsViewModel(),
    );
  }
}
