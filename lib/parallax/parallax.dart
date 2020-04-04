import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/utilities/screen_size.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';

import 'package:flutter/material.dart';

class ParallaxScreen extends StatelessWidget {
  const ParallaxScreen({Key key}) : super(key: key);

  static final _screenQueries = ScreenQueries.instance;

  @override
  Widget build(BuildContext context) {
    //

    return CustomScaffold(
      showAppBar: false,
      child: Stack(
        // alignment: AlignmentDirectional.center,
        children: <Widget>[
          Image.asset(
            WebAssets.socialDistance.assetName,
            fit: BoxFit.fitWidth,
            width: _screenQueries.width(context),
          )
        ],
      ),
    );
  }
}
