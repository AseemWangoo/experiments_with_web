import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/extensions/color_extension.dart';
import 'package:experiments_with_web/app_level/services/linker_service.dart';
import 'package:experiments_with_web/app_level/utilities/screen_size.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_button.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/locator.dart';
import 'package:experiments_with_web/parallax/utilities/constants.dart';
import 'package:experiments_with_web/parallax/utilities/model.dart';
import 'package:experiments_with_web/parallax/widgets/info_row.dart';

import 'package:flutter/material.dart';

class ParallaxScreen extends StatefulWidget {
  const ParallaxScreen({Key key}) : super(key: key);

  static final _screenQueries = ScreenQueries.instance;
  static final _linkService = locator<LinkerService>();

  @override
  _ParallaxScreenState createState() => _ParallaxScreenState();
}

class _ParallaxScreenState extends State<ParallaxScreen> {
  ScrollController _scrollController;

  double get _imgHeight => ParallaxScreen._screenQueries.height(context);
  double get _imageWidth => ParallaxScreen._screenQueries.width(context);

  double _currOffset = 0.0;

  void get _refresh => setState(() {});

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //

    return CustomScaffold(
      showAppBar: false,
      child: NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
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
            Positioned(
              top: _imgHeight * 0.8 -
                  _currOffset, // IMP otherwise goes on top...
              left: 0.0,
              right: 0.0,
              height: _imgHeight * 0.2,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const <double>[0, 1],
                    colors: [Colors.indigo.withOpacity(0), Colors.indigo],
                  ),
                ),
                child: SizedBox(width: double.infinity),
              ),
            ),
            ListView(
              cacheExtent: 100.0,
              addAutomaticKeepAlives: false,
              controller: _scrollController,
              children: <Widget>[
                SizedBox(height: _imgHeight), // IMP STEP 1..
                InfoRow(
                  sectionText: ParallaxConstants.whatUKnow,
                  covidList: <COVIDDataModel>[
                    COVIDDataModel(
                      title: ParallaxConstants.selfIsolation,
                      subtitle: ParallaxConstants.stayHomeDesc,
                      assetName: WebAssets.covidIsolation.assetName,
                    ),
                    COVIDDataModel(
                      title: ParallaxConstants.essentials,
                      subtitle: ParallaxConstants.essentialsDesc,
                      assetName: WebAssets.covidEssentials.assetName,
                    ),
                    COVIDDataModel(
                      title: ParallaxConstants.finance,
                      subtitle: ParallaxConstants.financeDesc,
                      assetName: WebAssets.covidFinancials.assetName,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
                InfoRow(
                  bgColor: HexColor.fromHex('#f5f5f3'),
                  sectionText: ParallaxConstants.united,
                  covidList: <COVIDDataModel>[
                    COVIDDataModel(
                      title: ParallaxConstants.beKind,
                      subtitle: ParallaxConstants.beKindDesc,
                      assetName: WebAssets.covidHeart.assetName,
                    ),
                    COVIDDataModel(
                      title: ParallaxConstants.stayHome,
                      subtitle: ParallaxConstants.stayHomeDesc,
                      assetName: WebAssets.covidHome.assetName,
                    ),
                    COVIDDataModel(
                      title: ParallaxConstants.washHands,
                      subtitle: ParallaxConstants.washHandsDesc,
                      assetName: WebAssets.covidWashHands.assetName,
                    ),
                  ],
                ),
                CustomButton(
                  bgColor: Colors.black,
                  onTap: () {
                    ParallaxScreen._linkService.openLink(WHOLinks.message);
                  },
                  name: 'View All',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  // void _scrollEventListener() {
  //   setState(() {
  //     if (_scrollController.hasClients) {
  //       _currOffset = _scrollController.offset;
  //     }
  //   });
  //   print('CURR OFFSET >>>> $_currOffset');
  //   // print('${_scrollController.hasClients}');
  //   // print('${_scrollController.position.maxScrollExtent}');
  //   // print('${_scrollController.position.outOfRange}');
  // }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      // print('>>>>>Scroll ${notification.scrollDelta}');
      _currOffset = notification.metrics.pixels;
    }

    _refresh;
    return false;
  }
}
