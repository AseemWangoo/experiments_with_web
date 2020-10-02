import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:experiments_with_web/app_level/extensions/widget_extension.dart';
import 'package:experiments_with_web/app_level/models/articles/articles.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/parallax_btn.dart';
import 'package:experiments_with_web/locator.dart';
import 'package:experiments_with_web/app_level/services/hive/hive_operations.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'grid_view.dart';

class OptionFav extends StatelessWidget {
  const OptionFav({Key key}) : super(key: key);

  static final _hiveService = locator<HiveOperationsService>();

  @override
  Widget build(BuildContext context) {
    final _nav = Navigator.of(context);

    return ValueListenableBuilder(
      builder: (_, Box<ArticlesModel> model, child) {
        //

        if (model.values.isEmpty) {
          return Center(
            child: Text(
              '🥺 🥺 No favorites !!',
              style: Theme.of(context).textTheme.bodyText1.c(Colors.white),
            ),
          );
        }

        return HomeGridView(
          children: _displayOptions(_nav, model),
        );
      },
      valueListenable: _hiveService.favBox.listenable(),
      child: const Placeholder(),
    );
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
        ).clickable(() => nav.pushNamed(_model.articleRoute)),
      );
    }

    return _list;
  }
}
