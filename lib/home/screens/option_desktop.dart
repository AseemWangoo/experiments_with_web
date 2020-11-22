import 'package:experiments_with_web/app_level/services/linker_service.dart';
import 'package:experiments_with_web/app_level/utilities/screen_size.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/sliver_scaffold.dart';
import 'package:experiments_with_web/home/widgets/carousel_card.dart';
import 'package:experiments_with_web/home/widgets/desktop_carousel.dart';
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
    final h = ScreenQueries.instance.height(context);

    return SimpleSliverScaffold(
      controller: _controller,
      minHeight: 120.0,
      maxHeight: 120.0,
      menu: TopNavBar(controller: _controller),
      children: [
        SizedBox(
          height: h * .3,
          child: DesktopCarousel(
            children: [
              CarouselCard(),
              CarouselCard(),
              CarouselCard(),
              CarouselCard(),
              CarouselCard(),
            ],
          ),
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
