import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/constants.dart';
import '../../../../common/common.dart';
import '../../../../generated/l10n.dart';
import '../../../widgets/button_grid.dart';
import '../../../widgets/top_app_bar.dart';
import 'finish_tour_viewmodel.dart';

class FinishTourView extends StatelessWidget {
  const FinishTourView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
      builder: (context, FinishTourViewModel model, child) => Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TopAppBar(
                            title:
                                S.of(context).finishExposition.toSentenceCase(),
                            onPressed: () => model.navigateToHome(),
                            hasImageBackground: false,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              S
                                  .of(context)
                                  .youFinishExposition('Persona')
                                  .toSentenceCase(),
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
                                model.expoFavItem?.name.toSentenceCase() ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(Assets.sculpture),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(32.0),
                              color: Colors.white,
                              border: Border.all(
                                width: 1.0,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              S
                                  .of(context)
                                  .favoriteExpositionPiece
                                  .toSentenceCase(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 24.0)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FloatingActionButton.extended(
                        onPressed: () async => await model.navigateToHome(),
                        icon: const Icon(FeatherIcons.share2),
                        label: Text(S.of(context).btnShare.toUpperCase()),
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: <Widget>[
                          ButtonGrid(
                            title: S.of(context).otherMuseums.toSentenceCase(),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: Text(
                              S.of(context).findOtherMuseums.toSentenceCase(),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () async => await model.navigateToHome(),
                      icon: const Icon(FeatherIcons.home),
                      label: Text(S.of(context).btnHome.toUpperCase()),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => FinishTourViewModel(),
    );
  }
}
