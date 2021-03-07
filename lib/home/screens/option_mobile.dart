import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/sliver_scaffold.dart';
import 'package:experiments_with_web/home/utils/mobile_links.dart';
import 'package:experiments_with_web/home/widgets/carousel_card.dart';
import 'package:experiments_with_web/home/widgets/desktop_carousel.dart';
import 'package:experiments_with_web/home/widgets/header.dart';
import 'package:experiments_with_web/home/widgets/top_nav.dart';

import 'package:flutter/material.dart';

class OptionMobile extends StatefulWidget {
  const OptionMobile({Key key}) : super(key: key);

  @override
  _OptionMobileState createState() => _OptionMobileState();
}

class _OptionMobileState extends State<OptionMobile> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    //
    return SimpleSliverScaffold(
      controller: _controller,
      minHeight: 120.0,
      maxHeight: 120.0,
      menu: TopNavBar(controller: _controller),
      children: [
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 88),
              child: Header(
                color: Colors.orange,
                text: 'Mobile Links',
              ),
            ),
            DesktopCarousel(
              children: [
                CarouselCard(
                  asset: MobileAssets.flutterEngage,
                  medium: MobileLinks.mediumFlutter2,
                  website: MobileLinks.webFlutter2,
                  youtubeLink: MobileLinks.ytFlutter2,
                ),
                CarouselCard(
                  asset: MobileAssets.testBloc,
                  medium: MobileLinks.mediumTestBloc,
                  website: MobileLinks.webTestBloc,
                  youtubeLink: MobileLinks.ytTestBloc,
                ),
              ],
            ),
            DesktopCarousel(
              children: [
                CarouselCard(
                  asset: MobileAssets.fday,
                  medium: MobileLinks.mediumFDay,
                  website: MobileLinks.webFDay,
                  youtubeLink: MobileLinks.ytFDay,
                ),
                CarouselCard(
                  asset: MobileAssets.tab,
                  medium: MobileLinks.mediumTAB,
                  website: MobileLinks.webTAB,
                  youtubeLink: MobileLinks.ytTAB,
                ),
                CarouselCard(
                  asset: MobileAssets.testProv,
                  medium: MobileLinks.mediumTestProv,
                  website: MobileLinks.webTestProv,
                  youtubeLink: MobileLinks.ytTestProv,
                ),
                CarouselCard(
                  asset: MobileAssets.services,
                  medium: MobileLinks.mediumService,
                  website: MobileLinks.webService,
                  youtubeLink: MobileLinks.ytService,
                ),
                CarouselCard(
                  asset: MobileAssets.sockets,
                  medium: MobileLinks.mediumSockets,
                  website: MobileLinks.webSockets,
                  youtubeLink: MobileLinks.ytSockets,
                ),
              ],
            ),
            DesktopCarousel(
              children: [
                CarouselCard(
                  asset: MobileAssets.aws,
                  medium: MobileLinks.mediumAWS,
                  website: MobileLinks.webAWS,
                  youtubeLink: MobileLinks.ytAWS,
                ),
                CarouselCard(
                  asset: MobileAssets.moor,
                  medium: MobileLinks.mediumMoor,
                  website: MobileLinks.webMoor,
                  youtubeLink: MobileLinks.ytMoor,
                ),
                CarouselCard(
                  asset: MobileAssets.provStreams,
                  medium: MobileLinks.mediumProvStreams,
                  website: MobileLinks.webProvStreams,
                  youtubeLink: MobileLinks.ytProvStreams,
                ),
                CarouselCard(
                  asset: MobileAssets.prov,
                  medium: MobileLinks.mediumProv,
                  website: MobileLinks.webProv,
                  youtubeLink: MobileLinks.ytProv,
                ),
                CarouselCard(
                  asset: MobileAssets.rekog,
                  medium: MobileLinks.mediumRekog,
                  website: MobileLinks.webRekog,
                  youtubeLink: MobileLinks.ytRekog,
                ),
              ],
            ),
            DesktopCarousel(
              children: [
                CarouselCard(
                  asset: MobileAssets.ar,
                  medium: MobileLinks.mediumAR,
                  website: MobileLinks.webAR,
                  youtubeLink: MobileLinks.ytAR,
                ),
                CarouselCard(
                  asset: MobileAssets.asheet,
                  medium: MobileLinks.mediumAS,
                  website: MobileLinks.webAS,
                  youtubeLink: MobileLinks.ytAS,
                ),
                CarouselCard(
                  asset: MobileAssets.crash,
                  medium: MobileLinks.mediumCrash,
                  website: MobileLinks.webCrash,
                  youtubeLink: MobileLinks.ytCrash,
                ),
                CarouselCard(
                  asset: MobileAssets.youTube,
                  medium: MobileLinks.mediumYT,
                  website: MobileLinks.webYT,
                  youtubeLink: MobileLinks.ytYT,
                ),
                CarouselCard(
                  asset: MobileAssets.gTranslation,
                  medium: MobileLinks.mediumGT,
                  website: MobileLinks.webGT,
                  youtubeLink: MobileLinks.ytGT,
                ),
              ],
            ),
            DesktopCarousel(
              children: [
                CarouselCard(
                  asset: MobileAssets.orientation,
                  medium: MobileLinks.mediumOrient,
                  website: MobileLinks.webOrient,
                  youtubeLink: MobileLinks.ytOrient,
                ),
                CarouselCard(
                  asset: MobileAssets.backdrop,
                  medium: MobileLinks.mediumBkdrp,
                  website: MobileLinks.webBkdrp,
                  youtubeLink: MobileLinks.ytBkdrp,
                ),
                CarouselCard(
                  asset: MobileAssets.cupertino,
                  medium: MobileLinks.mediumCupert,
                  website: MobileLinks.webCupert,
                  youtubeLink: MobileLinks.ytCupert,
                ),
                CarouselCard(
                  asset: MobileAssets.df,
                  medium: MobileLinks.mediumDF,
                  website: MobileLinks.webDF,
                  youtubeLink: MobileLinks.ytDF,
                ),
                CarouselCard(
                  asset: MobileAssets.widgetInspector,
                  medium: MobileLinks.mediumWI,
                  website: MobileLinks.webWI,
                  youtubeLink: MobileLinks.ytWI,
                ),
              ],
            ),
            DesktopCarousel(
              children: [
                CarouselCard(
                  asset: MobileAssets.whatsapp,
                  medium: MobileLinks.mediumWAT,
                  website: MobileLinks.webWAT,
                  youtubeLink: MobileLinks.ytWAT,
                ),
                CarouselCard(
                  asset: MobileAssets.webview,
                  medium: MobileLinks.mediumWV,
                  website: MobileLinks.webWV,
                  youtubeLink: MobileLinks.ytWV,
                ),
                CarouselCard(
                  asset: MobileAssets.sprite,
                  medium: MobileLinks.mediumSprite,
                  website: MobileLinks.webSprite,
                  youtubeLink: MobileLinks.ytSprite,
                ),
                CarouselCard(
                  asset: MobileAssets.oneSignal,
                  medium: MobileLinks.mediumOneSignal,
                  website: MobileLinks.webOneSignal,
                  youtubeLink: MobileLinks.ytOneSignal,
                ),
                CarouselCard(
                  asset: MobileAssets.stripe,
                  medium: MobileLinks.mediumStripe,
                  website: MobileLinks.webStripe,
                  youtubeLink: MobileLinks.ytStripe,
                ),
              ],
            ),
            DesktopCarousel(
              children: [
                CarouselCard(
                  asset: MobileAssets.sControl,
                  medium: MobileLinks.mediumSC,
                  website: MobileLinks.webSC,
                  youtubeLink: MobileLinks.ytSC,
                ),
                CarouselCard(
                  asset: MobileAssets.table,
                  medium: MobileLinks.mediumTable,
                  website: MobileLinks.webTable,
                  youtubeLink: MobileLinks.ytTable,
                ),
                CarouselCard(
                  asset: MobileAssets.shapeBorder,
                  medium: MobileLinks.mediumSBC,
                  website: MobileLinks.webSBC,
                  youtubeLink: MobileLinks.ytSBC,
                ),
                CarouselCard(
                  asset: MobileAssets.gQL,
                  medium: MobileLinks.mediumGQL,
                  website: MobileLinks.webGQL,
                  youtubeLink: MobileLinks.ytGQL,
                ),
              ],
            )
          ],
          shrinkWrap: true,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
