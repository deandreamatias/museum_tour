import 'package:flutter/material.dart';
import 'package:museum_tour/app/constants.dart';
import 'package:museum_tour/ui/widgets/top_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'finish_tour_viewmodel.dart';

class FinishTourView extends StatelessWidget {
  const FinishTourView({Key key}) : super(key: key);
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
                flex: 1,
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
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: TopAppBar(
                        title: 'Fin de la exposición',
                        onPressed: () => model.navigateToHome(),
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
              ),
              Expanded(
                flex: 1,
                child: Column(),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => FinishTourViewModel(),
    );
  }
}
