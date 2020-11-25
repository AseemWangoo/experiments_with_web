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
          ],
          shrinkWrap: true,
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
      ],
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
