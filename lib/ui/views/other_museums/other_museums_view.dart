import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stacked/stacked.dart';

import '../../../app/constants.dart';
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
                        image: DecorationImage(
                          image: const AssetImage(Assets.EXPO_MUSEUM),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: TopAppBar(
                        title: 'Otros museos',
                        onPressed: () => model.navigateToHome(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FloatingActionButton.extended(
                        onPressed: null,
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
              ),
              Expanded(
                flex: 1,
                child: Column(),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => OtherMuseumsViewModel(),
    );
  }
}
