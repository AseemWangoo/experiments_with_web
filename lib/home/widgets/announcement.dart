import 'package:experiments_with_web/app_level/extensions/color_extension.dart';
import 'package:experiments_with_web/home/utils/mobile_links.dart';
import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:experiments_with_web/app_level/extensions/widget_extension.dart';
import 'package:experiments_with_web/app_level/services/linker_service.dart';
import 'package:experiments_with_web/locator.dart';

import 'package:flutter/material.dart';

class Announcement extends StatelessWidget {
  static final _linkService = locator<LinkerService>();

  const Announcement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _whiteStyle = Theme.of(context).textTheme.subtitle1.c(Colors.white);

    return Container(
      padding: const EdgeInsets.all(2),
      alignment: Alignment.center,
      color: HexColor.fromHex('#231F20'),
      child: Text(
        'Flutter 2 Out! Click to find more',
        style: _whiteStyle.bold,
      ).clickable(
        () => _linkService.openLink(MobileLinks.mediumFlutter2),
      ),
    );
  }
}
