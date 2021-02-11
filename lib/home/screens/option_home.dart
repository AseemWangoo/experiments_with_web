import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/extensions/widget_extension.dart';
import 'package:experiments_with_web/app_level/models/articles/articles.dart';
import 'package:experiments_with_web/app_level/services/hive/hive_operations.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/parallax_btn.dart';
import 'package:experiments_with_web/search/widgets/search_bar.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/sliver_scaffold.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../locator.dart';
import '../widgets/grid_view.dart';
import '../widgets/top_nav.dart';

class OptionHome extends StatefulWidget {
  const OptionHome({Key key}) : super(key: key);

  @override
  _OptionHomeState createState() => _OptionHomeState();
}

class _OptionHomeState extends State<OptionHome> {
  ScrollController _controller;
  static final _hiveService = locator<HiveOperationsService>();

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    //
    final _nav = Navigator.of(context);

    return SimpleSliverScaffold(
      controller: _controller,
      minHeight: 120.0,
      maxHeight: 120.0,
      children: [
        SearchBar(),
        ValueListenableBuilder(
          builder: (_, Box<ArticlesModel> model, child) => HomeGridView(
            children: _displayOptions(_nav),
          ),
          valueListenable: _hiveService.favBox.listenable(),
        ),
      ],
      menu: TopNavBar(controller: _controller),
    );
  }

  List<Widget> _displayOptions(NavigatorState nav) {
    var _list = <Widget>[];
    var _count = OptionsModel.options().length;
    var _favBox = _OptionHomeState._hiveService.favBox;

    if (_favBox.isNotEmpty) {
      var _favCount = _favBox.length;

      for (var i = 0; i < _count; i++) {
        final _model = OptionsModel.options()[i];
        var _insertion = false;

        // FOR FAV CHECK
        for (var j = 0; j < _favCount; j++) {
          if (_model.articleID == _favBox.values.toList()[j].articleID) {
            _list.add(_addToList(nav, true, _model));
            _insertion = true;
            break;
          }
        }

        if (!_insertion) {
          _list.add(_addToList(nav, false, _model));
        }
      }
    } else {
      for (var i = 0; i < _count; i++) {
        final _model = OptionsModel.options()[i];
        _list.add(_addToList(nav, false, _model));
      }
    }

    return _list;
  }

  Widget _addToList(NavigatorState nav, bool value, ArticlesModel _model) =>
      ParallaxButton(
        isFavorite: value,
        medium: _model.articleLinks.first,
        model: _model,
        text: _model.articleName,
        website: _model.articleLinks[1],
        youtubeLink: _model.articleLinks.last,
      ).clickable(() => nav.pushNamed(_model.articleRoute));

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
