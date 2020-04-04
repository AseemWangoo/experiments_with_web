import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/utilities/screen_size.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/parallax/widgets/info_row.dart';

import 'package:flutter/material.dart';

class ParallaxScreen extends StatefulWidget {
  const ParallaxScreen({Key key}) : super(key: key);

  static final _screenQueries = ScreenQueries.instance;

  @override
  _ParallaxScreenState createState() => _ParallaxScreenState();
}

class _ParallaxScreenState extends State<ParallaxScreen> {
  ScrollController _scrollController;

  double get _imgHeight => ParallaxScreen._screenQueries.height(context);
  double get _imageWidth => ParallaxScreen._screenQueries.width(context);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollEventListener);
  }

  @override
  Widget build(BuildContext context) {
    //

    return CustomScaffold(
      showAppBar: false,
      child: Stack(
        children: <Widget>[
          Image.asset(
            WebAssets.socialDistance.assetName,
            fit: BoxFit.fitWidth,
            width: _imageWidth,
            height: _imgHeight,
          ),
          ListView(
            controller: _scrollController,
            children: <Widget>[
              SizedBox(height: _imgHeight), // IMP..
              InfoRow(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollEventListener() {
    print('${_scrollController.offset}');
  }
}
