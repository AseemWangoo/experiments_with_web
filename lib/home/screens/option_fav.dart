import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:experiments_with_web/app_level/extensions/widget_extension.dart';
import 'package:experiments_with_web/app_level/models/articles/articles.dart';
import 'package:experiments_with_web/app_level/services/linker_service.dart';
import 'package:experiments_with_web/app_level/styles/colors.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/parallax_btn.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/sliver_scaffold.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/spacer_view.dart';
import 'package:experiments_with_web/home/widgets/top_nav.dart';
import 'package:experiments_with_web/locator.dart';
import 'package:experiments_with_web/app_level/services/hive/hive_operations.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/grid_view.dart';

class OptionFav extends StatefulWidget {
  const OptionFav({Key key}) : super(key: key);

  static final _hiveService = locator<HiveOperationsService>();

  @override
  _OptionFavState createState() => _OptionFavState();
}

class _OptionFavState extends State<OptionFav> {
  ScrollController _controller;
  static final _linkService = locator<LinkerService>();

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final _nav = Navigator.of(context);

    return SimpleSliverScaffold(
      controller: _controller,
      minHeight: 120.0,
      maxHeight: 120.0,
      menu: TopNavBar(controller: _controller),
      children: [
        ValueListenableBuilder(
          builder: (_, Box<ArticlesModel> model, child) {
            //

            if (model.values.isEmpty) {
              return Center(
                child: Column(
                  children: [
                    const SizedBox(height: 80.0),
                    Text(
                      '🥺 🥺 No favorites !!',
                      style:
                          Theme.of(context).textTheme.bodyText1.c(Colors.white),
                    ),
                  ],
                ),
              );
            }

            return HomeGridView(
              children: _displayOptions(_nav, model),
            );
          },
          valueListenable: OptionFav._hiveService.favBox.listenable(),
        ),
        const SizedBox(height: 80),
        SpacerView(
          child: Card(
            color: AppColors.brandColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'See the implementation',
                  style: Theme.of(context).textTheme.bodyText1.c(Colors.white),
                ),
                IconButton(
                  color: Colors.white,
                  icon: FaIcon(FontAwesomeIcons.youtube),
                  iconSize: 20.0,
                  padding: EdgeInsets.zero,
                  onPressed: () => _linkService.openLink(BrandLinks.favYoutube),
                ),
                IconButton(
                  color: Colors.white,
                  iconSize: 20.0,
                  icon: FaIcon(FontAwesomeIcons.medium),
                  padding: EdgeInsets.zero,
                  onPressed: () => _linkService.openLink(BrandLinks.favMedium),
                ),
                IconButton(
                  iconSize: 20.0,
                  color: Colors.white,
                  icon: FaIcon(FontAwesomeIcons.chrome),
                  padding: EdgeInsets.zero,
                  onPressed: () => _linkService.openLink(BrandLinks.favWebsite),
                ),
              ],
            ),
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

  List<Widget> _displayOptions(NavigatorState nav, Box<ArticlesModel> model) {
    var _list = <Widget>[];
    var _count = model.length;

    for (var i = 0; i < _count; i++) {
      final _model = model.getAt(i);

      _list.add(
        ParallaxButton(
          text: _model.articleName,
          medium: _model.articleLinks.first,
          website: _model.articleLinks[1],
          youtubeLink: _model.articleLinks.last,
          isFavorite: true,
          model: _model,
        ).clickable(() => nav.pushNamed(_model.articleRoute)),
      );
    }

    return _list;
  }
}
