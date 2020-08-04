import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/constants.dart';
import '../../../widgets/button_grid.dart';
import '../../../widgets/top_app_bar.dart';
import 'finish_tour_viewmodel.dart';

class FinishTourView extends StatelessWidget {
  const FinishTourView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TopAppBar(
                        title: 'Fin de la exposición',
                        onPressed: () => model.navigateToHome(),
                        hasImageBackground: false,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Ana Júlia, has finalizado tu visita a la exposición pre colombina',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width * 2 / 3,
                        width: MediaQuery.of(context).size.width * 2 / 3,
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Chalchiuhtlicue',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(Assets.SCULPTURE),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(32.0),
                          color: Colors.white,
                          border: Border.all(
                            width: 1.0,
                            color: CustomColor.ACCENT,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Parece que esta pieza ha sido la que más te ha gustado. Si quieres puedes compartirla en tus redes sociales',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 40.0)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FloatingActionButton.extended(
                    onPressed: () async => await model.navigateToHome(),
                    icon: Icon(
                      Icons.share,
                      color: CustomColor.TEXT_HIGH,
                    ),
                    backgroundColor: CustomColor.ACCENT,
                    label: Text(
                      'COMPARTIR',
                      style: TextStyle(
                        color: CustomColor.TEXT_HIGH,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Flexible(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: <Widget>[
                        ButtonGrid(
                          title: 'Otros museos',
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            'También puedes ver donde se encuentran otros museos de historia de América',
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  FlatButton.icon(
                    onPressed: () async => await model.navigateToHome(),
                    icon: Icon(Icons.home),
                    label: Text('INICIO'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => FinishTourViewModel(),
    );
  }
}
