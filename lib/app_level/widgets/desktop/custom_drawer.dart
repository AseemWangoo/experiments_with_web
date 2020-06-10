import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/extensions/color_extension.dart';

import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key, this.youtubeLink}) : super(key: key);

  final String youtubeLink;

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
            decoration: BoxDecoration(color: HexColor.fromHex('#002B5C')),
          ),
          ListTile(
            trailing: const Icon(Icons.info),
            title: const Text(DrawerOptions.info),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationLegalese: DrawerOptions.legalese,
              );
            },
          ),
        ],
      ),
    );
  }
}
