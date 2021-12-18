import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stacked/stacked.dart';

import '../../../common/common.dart';
import '../../../generated/l10n.dart';
import '../../widgets/top_app_bar.dart';
import 'other_museums_viewmodel.dart';

class OtherMuseumsView extends StatefulWidget {
  const OtherMuseumsView({Key? key}) : super(key: key);

  @override
  _OtherMuseumsViewState createState() => _OtherMuseumsViewState();
}

class _OtherMuseumsViewState extends State<OtherMuseumsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (OtherMuseumsViewModel model) => model.loadMuseumsInfo(),
      builder: (context, OtherMuseumsViewModel model, child) => Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            height: constraints.maxHeight,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TopAppBar(
                              title:
                                  S.of(context).otherMuseums.toSentenceCase(),
                              onPressed: () => model.navigateToHome(),
                              hasImageBackground: false,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Text(
                                S
                                    .of(context)
                                    .selectOtherMuseums
                                    .toSentenceCase(),
                                style: Theme.of(context).textTheme.subtitle1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: model.isBusy
                                  ? const CircularProgressIndicator()
                                  : Wrap(
                                      children: [
                                        ...model.museums
                                            .map(
                                              (item) => ChoiceChip(
                                                label: Text(item.name),
                                                onSelected: (value) => {},
                                                selected: true,
                                              ),
                                            )
                                            .toList()
                                      ],
                                    ),
                            ),
                            const SizedBox(height: 32.0)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FloatingActionButton.extended(
                          onPressed: () async => await model.openLink(),
                          icon: const Icon(FeatherIcons.map),
                          label: Text(S.of(context).btnHowToGet.toUpperCase()),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: constraints.maxWidth,
                    padding: const EdgeInsets.all(16.0),
                    child: model.isBusy
                        ? const CircularProgressIndicator()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                S
                                    .of(context)
                                    .phone
                                    .addTwoDots(model.museumSelected.telephone)
                                    .toSentenceCase(),
                              ),
                              Text(
                                S.of(context).website.toSentenceCase(),
                              ),
                              Text(
                                S
                                    .of(context)
                                    .province
                                    .addTwoDots(model.museumSelected.province)
                                    .toSentenceCase(),
                              ),
                              Text(
                                S
                                    .of(context)
                                    .prices
                                    .addTwoDots(model.museumSelected.price)
                                    .toSentenceCase(),
                              ),
                              Text(
                                S
                                    .of(context)
                                    .schedules
                                    .addTwoDots(model.museumSelected.schedules)
                                    .toSentenceCase(),
                              ),
                              const SizedBox(height: 40.0),
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
