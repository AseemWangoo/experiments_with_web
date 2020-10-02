import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:experiments_with_web/app_level/extensions/widget_extension.dart';
import 'package:experiments_with_web/app_level/services/linker_service.dart';
import 'package:experiments_with_web/app_level/styles/colors.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/image_loader.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/parallax_btn.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/sliver_scaffold.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../locator.dart';

class OptionHome extends StatefulWidget {
  const OptionHome({Key key}) : super(key: key);

  @override
  _OptionHomeState createState() => _OptionHomeState();
}

class _OptionHomeState extends State<OptionHome> {
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
    final _nav = Navigator.of(context);
    final _whiteStyle = Theme.of(context).textTheme.headline6.c(Colors.white);

    return SimpleSliverScaffold(
      controller: _controller,
      minHeight: 120.0,
      maxHeight: 120.0,
      children: [
        GridView.count(
          childAspectRatio: 0.8,
          shrinkWrap: true,
          crossAxisCount: 5,
          crossAxisSpacing: 32.0,
          mainAxisSpacing: 16.0,
          padding: const EdgeInsets.all(32.0),
          children: _displayOptions(_nav),
        ),
      ],
      menu: Container(
        color: AppColors.navColor,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 24),
        child: Row(
          children: [
            ImageWidgetPlaceholder(image: WebAssets.logo).clickable(() {
              _controller.animateTo(
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
                      iconSize: 20.0,
                      padding: EdgeInsets.zero,
                      onPressed: () =>
                          _linkService.openLink(BrandLinks.youtube),
                    ),
                    IconButton(
                      color: Colors.white,
                      iconSize: 20.0,
                      icon: FaIcon(FontAwesomeIcons.medium),
                      padding: EdgeInsets.zero,
                      onPressed: () => _linkService.openLink(BrandLinks.medium),
                    ),
                    IconButton(
                      iconSize: 20.0,
                      color: Colors.white,
                      icon: FaIcon(FontAwesomeIcons.chrome),
                      padding: EdgeInsets.zero,
                      onPressed: () =>
                          _linkService.openLink(BrandLinks.website),
                    ),
                    IconButton(
                      iconSize: 20.0,
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
              ],
            ),
            const Spacer(),
            Text(
              ApplevelConstants.supportTitle,
              style: _whiteStyle,
            ).clickable(() => _linkService.openLink(BrandLinks.support)),
          ],
        ),
      ),
    );
  }

  List<Widget> _displayOptions(NavigatorState nav) {
    var _list = <Widget>[];
    var _count = OptionsModel.options().length;

    for (var i = 0; i < _count; i++) {
      final _model = OptionsModel.options()[i];

      _list.add(
        ParallaxButton(
          isFavorite: true,
          medium: _model.articleLinks.first,
          text: _model.articleName,
          website: _model.articleLinks[1],
          youtubeLink: _model.articleLinks.last,
        ).clickable(() => nav.pushNamed(_model.articleRoute)),
      );
    }

    return _list;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
