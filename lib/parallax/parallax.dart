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

  double _currOffset = 0.0;

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
          Positioned(
            top: -0.25 * _currOffset, // -ve as we want to scroll upwards
            child: Image.asset(
              WebAssets.socialDistance.assetName,
              fit: BoxFit.fitWidth,
              width: _imageWidth,
              height: _imgHeight,
            ),
          ),
          ListView(
            cacheExtent: 100.0,
            addAutomaticKeepAlives: false,
            controller: _scrollController,
            children: <Widget>[
              SizedBox(height: _imgHeight), // IMP STEP 1..
              InfoRow(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  void _scrollEventListener() {
    setState(() {
      if (_scrollController.hasClients) {
        _currOffset = _scrollController.offset;
      }
    });
    print('CURR OFFSET >>>> $_currOffset');
    // print('${_scrollController.hasClients}');
    // print('${_scrollController.position.maxScrollExtent}');
    // print('${_scrollController.position.outOfRange}');
  }
}
