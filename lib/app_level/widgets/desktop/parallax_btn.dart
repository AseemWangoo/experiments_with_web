import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/services/linker_service.dart';
import 'package:experiments_with_web/app_level/utilities/screen_size.dart';
import 'package:experiments_with_web/locator.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ParallaxButton extends StatelessWidget {
  const ParallaxButton({
    Key key,
    this.text,
    @required this.medium,
    @required this.website,
    @required this.youtubeLink,
  }) : super(key: key);

  final String medium;
  final String website;
  final String youtubeLink;

  final String text;

  ShapeBorder get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final _height = ScreenQueries.instance.height(context);
    final _width = ScreenQueries.instance.width(context);

    return SizedBox(
      width: _width * 0.15,
      height: _height * 0.4,
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
        elevation: 8,
        shape: shape,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                child: Image.asset(
                  WebAssets.logo.assetName,
                  width: double.maxFinite,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Expanded(
              child: _Content(
                text: text,
                medium: medium,
                website: website,
                youtubeLink: youtubeLink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key key,
    this.text,
    @required this.medium,
    @required this.website,
    @required this.youtubeLink,
  }) : super(key: key);

  final String text;

  final String medium;
  final String website;
  final String youtubeLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(text, style: TextStyle(fontSize: 20)),
          Text('Links', style: Theme.of(context).textTheme.caption),
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
