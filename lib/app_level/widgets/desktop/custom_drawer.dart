import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/extensions/hover_extension.dart';
import 'package:experiments_with_web/app_level/services/linker_service.dart';
import 'package:experiments_with_web/app_level/styles/colors.dart';
import 'package:experiments_with_web/locator.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
    @required this.medium,
    @required this.website,
    @required this.youtubeLink,
  })  : assert(
          youtubeLink != null,
          website != null,
        ),
        super(key: key);

  final String medium;
  final String website;
  final String youtubeLink;

  static final _linkService = locator<LinkerService>();

  @override
  Widget build(BuildContext context) {
    //

    return Drawer(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Image.asset(
              WebAssets.logo.assetName,
              fit: BoxFit.contain,
            ),
            decoration: BoxDecoration(color: AppColors.brandColor),
          ),
          ListTile(
            trailing: _LinkButton(
              iconData: FontAwesomeIcons.youtube,
              link: youtubeLink,
            ),
            title: const Text(DrawerOptions.youtube),
            onTap: () => _linkService.openLink(youtubeLink),
          ).showCursorOnHover,
          ListTile(
            trailing: _LinkButton(
              iconData: FontAwesomeIcons.chrome,
              link: website,
            ),
            title: const Text(DrawerOptions.website),
            onTap: () => _linkService.openLink(website),
          ).showCursorOnHover,
          ListTile(
            trailing: _LinkButton(
              iconData: FontAwesomeIcons.medium,
              link: medium,
            ),
            title: const Text(DrawerOptions.medium),
            onTap: () => _linkService.openLink(medium),
          ).showCursorOnHover,
          ListTile(
            trailing: const Icon(Icons.info),
            title: const Text(DrawerOptions.info),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationLegalese: DrawerOptions.legalese,
              );
            },
          ).showCursorOnHover,
        ],
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  const _LinkButton({
    Key key,
    @required this.link,
    @required this.iconData,
  }) : super(key: key);

  final String link;
  final IconData iconData;

  static final _linkService = locator<LinkerService>();

  @override
  Widget build(BuildContext context) {
    //

    return IconButton(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      icon: FaIcon(iconData),
      onPressed: () => _linkService.openLink(link),
    );
  }
}
