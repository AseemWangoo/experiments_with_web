import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/sliver_scaffold.dart';
import 'package:experiments_with_web/home/utils/dsktp_links.dart';
import 'package:experiments_with_web/home/widgets/carousel_card.dart';
import 'package:experiments_with_web/home/widgets/desktop_carousel.dart';
import 'package:experiments_with_web/home/widgets/header.dart';
import 'package:experiments_with_web/home/widgets/top_nav.dart';

import 'package:flutter/material.dart';

class OptionDesktop extends StatefulWidget {
  const OptionDesktop({Key key}) : super(key: key);

  @override
  _OptionDesktopState createState() => _OptionDesktopState();
}

class _OptionDesktopState extends State<OptionDesktop> {
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
                text: 'Desktop Links',
              ),
            ),
            DesktopCarousel(
              children: [
                CarouselCard(
                  asset: DesktopAssets.ffiLinux,
                  medium: DesktopLinks.mediumFfiLinux,
                  website: DesktopLinks.webFfiLinux,
                  youtubeLink: DesktopLinks.ytFfiLinux,
                ),
                CarouselCard(
                  asset: DesktopAssets.cloudRun,
                  medium: DesktopLinks.mediumCloudRun,
                  website: DesktopLinks.webCloudRun,
                  youtubeLink: DesktopLinks.ytCloudRun,
                ),
                CarouselCard(
                  asset: DesktopAssets.dsktpMacOSC,
                  medium: DesktopLinks.mediumFFIMacOS,
                  website: DesktopLinks.webFFIMacOS,
                  youtubeLink: DesktopLinks.ytFFIMacOS,
                ),
                CarouselCard(
                  asset: DesktopAssets.ffi,
                  medium: DesktopLinks.mediumFFI,
                  website: DesktopLinks.webFFI,
                  youtubeLink: DesktopLinks.ytFFI,
                ),
                CarouselCard(
                  asset: DesktopAssets.plugin,
                  medium: DesktopLinks.mediumPlugin,
                  website: DesktopLinks.webPlugin,
                  youtubeLink: DesktopLinks.ytPlugin,
                ),
              ],
            ),
            DesktopCarousel(
              showNavButtons: false,
              children: [
                CarouselCard(
                  asset: DesktopAssets.liquidCardsVignette,
                  medium: DesktopLinks.mediumLCV,
                  website: DesktopLinks.webLCV,
                  youtubeLink: DesktopLinks.ytLCV,
                ),
                CarouselCard(
                  asset: DesktopAssets.darkModeVignette,
                  medium: DesktopLinks.mediumDMV,
                  website: DesktopLinks.webDMV,
                  youtubeLink: DesktopLinks.ytDMV,
                ),
                CarouselCard(
                  asset: DesktopAssets.boardingVignette,
                  medium: DesktopLinks.mediumBPV,
                  website: DesktopLinks.webBPV,
                  youtubeLink: DesktopLinks.ytBPV,
                ),
                CarouselCard(
                  asset: DesktopAssets.threeD,
                  medium: DesktopLinks.medium3D,
                  website: DesktopLinks.web3D,
                  youtubeLink: DesktopLinks.yt3D,
                ),
                CarouselCard(
                  asset: DesktopAssets.dsktp,
                  medium: DesktopLinks.mediumDsktp,
                  website: DesktopLinks.webDsktp,
                  youtubeLink: DesktopLinks.ytDsktp,
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
