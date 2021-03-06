import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:experiments_with_web/home/widgets/announcement.dart';
import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:experiments_with_web/app_level/extensions/widget_extension.dart';
import 'package:experiments_with_web/app_level/services/linker_service.dart';
import 'package:experiments_with_web/app_level/styles/colors.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/image_loader.dart';
import 'package:experiments_with_web/locator.dart';

class TopNavBar extends StatefulWidget {
  const TopNavBar({
    Key key,
    @required this.controller,
    this.showAnnouncement = true,
  }) : super(key: key);

  final ScrollController controller;
  final bool showAnnouncement;

  @override
  _TopNavBarState createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {
  static final _linkService = locator<LinkerService>();

  TextStyle get _whiteStyle =>
      Theme.of(context).textTheme.headline6.c(Colors.white);

  @override
  Widget build(BuildContext context) {
    //

    return Container(
      color: AppColors.navColor,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Row(
        children: [
          ImageWidgetPlaceholder(image: WebAssets.logo).clickable(() {
            widget.controller.animateTo(
              0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }),
          const Spacer(),
          Column(
            children: <Widget>[
              Text(ApplevelConstants.homeTitle, style: _whiteStyle),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    color: Colors.white,
                    icon: FaIcon(FontAwesomeIcons.youtube),
                    iconSize: 18.0,
                    padding: EdgeInsets.zero,
                    onPressed: () => _linkService.openLink(BrandLinks.youtube),
                  ),
                  IconButton(
                    color: Colors.white,
                    iconSize: 18.0,
                    icon: FaIcon(FontAwesomeIcons.medium),
                    padding: EdgeInsets.zero,
                    onPressed: () => _linkService.openLink(BrandLinks.medium),
                  ),
                  IconButton(
                    iconSize: 18.0,
                    color: Colors.white,
                    icon: FaIcon(FontAwesomeIcons.chrome),
                    padding: EdgeInsets.zero,
                    onPressed: () => _linkService.openLink(BrandLinks.website),
                  ),
                  IconButton(
                    iconSize: 18.0,
                    color: Colors.white,
                    icon: FaIcon(FontAwesomeIcons.dev),
                    padding: EdgeInsets.zero,
                    onPressed: () => _linkService.openLink(BrandLinks.devTo),
                  ),
                  IconButton(
                    iconSize: 20.0,
                    color: Colors.white,
                    icon: FaIcon(FontAwesomeIcons.github),
                    padding: EdgeInsets.zero,
                    onPressed: () => _linkService.openLink(BrandLinks.github),
                  ),
                ],
              ),
              if (widget.showAnnouncement) ...const [Spacer(), Announcement()],
            ],
          ),
          const Spacer(),
          Text(
            ApplevelConstants.supportTitle,
            style: _whiteStyle,
          ).clickable(() => _linkService.openLink(BrandLinks.support)),
        ],
      ),
    );
  }
}
