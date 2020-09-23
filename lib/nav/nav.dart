import 'package:experiments_with_web/app_level/extensions/color_extension.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/widget_screen.dart';
import 'package:experiments_with_web/globals.dart';

import 'package:flutter/material.dart';

import 'utilities/constants.dart';

class VisitedScreens extends StatelessWidget {
  const VisitedScreens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return CustomScaffold(
      titleText: NavConstants.title,
      enableDarkMode: true,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _Internal(),
            _Internal(),
          ],
        ),
      ),
    );
  }
}

class _Internal extends StatelessWidget {
  const _Internal({Key key}) : super(key: key);
  static final data = AppGlobals.routeObserver.navStack.fetchAll();

  @override
  Widget build(BuildContext context) {
    return WidgetScreener(
      ratio: 1 / 2,
      child: ListView.separated(
        itemCount: data.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 3, color: Colors.white),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 150,
            color: HexColor.fromHex('#820263'),
            child: Center(child: Text('${data[index]}')),
          );
        },
      ),
    );
  }
}
