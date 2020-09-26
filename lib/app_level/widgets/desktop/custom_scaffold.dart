import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:experiments_with_web/app_level/styles/themes.dart';

import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    Key key,
    this.titleText = 'Your Title',
    this.child,
    this.showAppBar = true,
    this.showDrawer = false,
    this.showAppBarActions = false,
    this.enableDarkMode = false,
    this.drawerChild,
    Widget bottomSheet,
    this.actions,
  })  : _bottomSheet = bottomSheet,
        super(key: key);

  final String titleText;
  final Widget child;
  final bool showAppBar;
  final bool showAppBarActions;
  final bool showDrawer;
  final bool enableDarkMode;
  final Widget drawerChild;
  final Widget _bottomSheet;
  final List<Widget> actions;

  static TextStyle get light => TextStyle().c(Colors.black);
  static TextStyle get dark => TextStyle().c(Colors.white);

  List<Widget> get _showActions {
    if (showAppBarActions) {
      return actions;
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    //

    return Theme(
      data: enableDarkMode
          ? ThemeData.dark().copyWith(
              textTheme: ThemeData.dark().textTheme.apply(
                    fontFamily: ApplevelConstants.fontFamily,
                  ),
            )
          : AppTheme.darkTheme,
      child: Scaffold(
        appBar: showAppBar
            ? AppBar(
                actions: _showActions,
                title: Text(titleText, style: enableDarkMode ? dark : light),
              )
            : null,
        body: child ?? const Center(child: Text('Hi there')),
        endDrawer: showDrawer ? drawerChild : null,
        bottomSheet: _bottomSheet,
      ),
    );
  }
}
