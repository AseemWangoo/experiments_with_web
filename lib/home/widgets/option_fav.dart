import 'package:experiments_with_web/app_level/models/articles/articles.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/parallax_btn.dart';
import 'package:experiments_with_web/locator.dart';
import 'package:experiments_with_web/app_level/services/hive/hive_operations.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class OptionFav extends StatelessWidget {
  const OptionFav({Key key}) : super(key: key);

  static final _hiveService = locator<HiveOperationsService>();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (_, Box<ArticlesModel> model, child) {
        //

        if (model.values.isEmpty) {
          return Center(
            child: Text("No data"),
          );
        }

        return Center(
          child: Text(model.length.toString()),
        );
      },
      valueListenable: _hiveService.favBox.listenable(),
      child: const Placeholder(),
    );
  }

  // List<Widget> _displayOptions(NavigatorState nav, Box<ArticlesModel> model) {
  //   var _list = <Widget>[];
  //   var _count = model.length;

  //   for (var i = 0; i < _count; i++) {
  //     final _model = ArticlesModelAdapter().;

  //     _list.add(
  //       ParallaxButton(
  //         text: _model.articleName,
  //         medium: _model.articleLinks.first,
  //         website: _model.articleLinks[1],
  //         youtubeLink: _model.articleLinks.last,
  //         onfavClick: () {},
  //       ).clickable(() => nav.pushNamed(_model.articleRoute)),
  //     );
  //   }

  //   return _list;
  // }
}
