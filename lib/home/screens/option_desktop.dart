import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/services/linker_service.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/sliver_scaffold.dart';
import 'package:experiments_with_web/home/utils/dsktp_links.dart';
import 'package:experiments_with_web/home/widgets/carousel_card.dart';
import 'package:experiments_with_web/home/widgets/desktop_carousel.dart';
import 'package:experiments_with_web/home/widgets/header.dart';
import 'package:experiments_with_web/home/widgets/top_nav.dart';
import 'package:experiments_with_web/locator.dart';

import 'package:flutter/material.dart';

class OptionDesktop extends StatefulWidget {
  const OptionDesktop({Key key}) : super(key: key);

  @override
  _OptionDesktopState createState() => _OptionDesktopState();
}

class _OptionDesktopState extends State<OptionDesktop> {
  ScrollController _controller;
  static final _linkService = locator<LinkerService>();

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
                text: 'Desktop Links',
              ),
            ),
            DesktopCarousel(
              children: [
                CarouselCard(
                  asset: DesktopAssets.ffi,
                  website: DesktopLinks.websiteFFI,
                  youtubeLink: DesktopLinks.youtubeFFI,
                ),
                CarouselCard(
                  asset: DesktopAssets.plugin,
                  website: DesktopLinks.websiteFFI,
                  youtubeLink: DesktopLinks.youtubeFFI,
                ),
                CarouselCard(
                  asset: DesktopAssets.liquidCardsVignette,
                  website: DesktopLinks.websiteFFI,
                  youtubeLink: DesktopLinks.youtubeFFI,
                ),
                CarouselCard(
                  asset: DesktopAssets.darkModeVignette,
                  website: DesktopLinks.websiteFFI,
                  youtubeLink: DesktopLinks.youtubeFFI,
                ),
                CarouselCard(
                  asset: DesktopAssets.boardingVignette,
                  website: DesktopLinks.websiteFFI,
                  youtubeLink: DesktopLinks.youtubeFFI,
                ),
              ],
            ),
            DesktopCarousel(
              showNavButtons: false,
              children: [
                CarouselCard(
                  asset: DesktopAssets.threeD,
                  website: DesktopLinks.websiteFFI,
                  youtubeLink: DesktopLinks.youtubeFFI,
                ),
                CarouselCard(
                  asset: DesktopAssets.dsktp,
                  website: DesktopLinks.websiteFFI,
                  youtubeLink: DesktopLinks.youtubeFFI,
                ),
              ],
            ),
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
