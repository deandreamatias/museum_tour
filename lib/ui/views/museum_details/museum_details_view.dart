import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants.dart';
import '../../../common/common.dart';
import '../../../generated/l10n.dart';
import '../../widgets/button_grid.dart';
import '../../widgets/dialog_museum.dart';
import '../../widgets/top_app_bar.dart';
import 'museum_details_viewmodel.dart';

class MuseumDetailsView extends StatefulWidget {
  const MuseumDetailsView({Key? key}) : super(key: key);

  @override
  _MuseumDetailsViewState createState() => _MuseumDetailsViewState();
}

class _MuseumDetailsViewState extends State<MuseumDetailsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onModelReady: (MuseumDetailsViewModel model) async =>
          await model.loadMuseumInfo(),
      builder: (context, MuseumDetailsViewModel model, child) => Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(bottom: 40.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(32.0),
                        bottomLeft: Radius.circular(32.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage(Assets.infoMuseum),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: model.isBusy
                        ? const CircularProgressIndicator()
                        : TopAppBar(
                            title: model.museum?.name ?? '',
                            onPressed: () async => await model.navigateToHome(),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton.extended(
                      onPressed: () async =>
                          await model.openLink(isWebsite: false),
                      icon: const Icon(FeatherIcons.map),
                      label: Text(S.of(context).btnHowToGet.toUpperCase()),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ButtonGrid(
                        title: S.of(context).schedules.toSentenceCase(),
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => DialogMuseum(
                            title: S.of(context).schedules.toSentenceCase(),
                            content: model.museum?.schedules ?? '',
                          ),
                        ),
                      ),
                      ButtonGrid(
                        title: S.of(context).prices.toSentenceCase(),
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => DialogMuseum(
                            title: S.of(context).prices.toSentenceCase(),
                            content: model.museum?.price ?? '',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ButtonGrid(
                        title: S.of(context).contact.toSentenceCase(),
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => DialogMuseum(
                            title: S.of(context).contact.toSentenceCase(),
                            content: model.museumContact,
                          ),
                        ),
                      ),
                      ButtonGrid(
                        title: S.of(context).website.toSentenceCase(),
                        onPressed: () => model.openLink(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => MuseumDetailsViewModel(),
    );
  }
}
