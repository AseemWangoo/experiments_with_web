import 'package:auto_size_text/auto_size_text.dart';

import 'package:experiments_with_web/app_level/models/articles/articles.dart';
import 'package:experiments_with_web/app_level/services/hive/hive_operations.dart';
import 'package:experiments_with_web/app_level/services/linker_service.dart';
import 'package:experiments_with_web/locator.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LinkContent extends StatelessWidget {
  const LinkContent({
    Key key,
    this.text,
    @required this.medium,
    @required this.website,
    @required this.youtubeLink,
    @required this.isFavorite,
    this.model,
  }) : super(key: key);

  final String text;

  final String medium;
  final String website;
  final String youtubeLink;
  final bool isFavorite;

  final ArticlesModel model;

  static final _hiveService = locator<HiveOperationsService>();

  @override
  Widget build(BuildContext context) {
    //

    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              AutoSizeText(text, minFontSize: 16),
              const Spacer(),
              if (isFavorite)
                GestureDetector(
                  child: const Icon(Icons.favorite, color: Colors.orangeAccent),
                  onTap: () => _hiveService.deleteFromFavBox(model),
                )
              else
                GestureDetector(
                  child: const Icon(Icons.favorite_border),
                  onTap: () => _hiveService.addToFavBox(model),
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _LinkButton(
                iconData: FontAwesomeIcons.youtube,
                link: youtubeLink,
              ),
              _LinkButton(
                iconData: FontAwesomeIcons.chrome,
                link: website,
              ),
              _LinkButton(
                iconData: FontAwesomeIcons.medium,
                link: medium,
              ),
            ],
          )
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
      iconSize: 18.0,
      padding: EdgeInsets.zero,
      icon: FaIcon(iconData),
      onPressed: () => _linkService.openLink(link),
    );
  }
}
