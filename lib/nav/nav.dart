import 'dart:html';

import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/extensions/color_extension.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/widget_screen.dart';
import 'package:experiments_with_web/globals.dart';

import 'package:flutter/material.dart';

import 'utilities/constants.dart';

class VisitedScreens extends StatefulWidget {
  const VisitedScreens({Key key}) : super(key: key);

  @override
  _VisitedScreensState createState() => _VisitedScreensState();
}

class _VisitedScreensState extends State<VisitedScreens> {
  //
  List<String> get _ascOrderData =>
      AppGlobals.routeObserver.navStack.fetchAll();
  List<String> get _descOrderData => List<String>.from(_ascOrderData.reversed);

  @override
  Widget build(BuildContext context) {
    //

    return CustomScaffold(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: OutlinedButton.icon(
            onPressed: () {
              AppGlobals.routeObserver.navStack.clear;
              setState(() {});
            },
            icon: const Icon(Icons.clear),
            label: const Text(NavConstants.clearHistory),
          ),
        ),
      ],
      showAppBarActions: true,
      titleText: NavConstants.title,
      enableDarkMode: true,
      child: Center(
        child: WidgetScreener(
          ratio: 1,
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(icon: const Icon(Icons.arrow_upward)),
                    Tab(icon: const Icon(Icons.arrow_downward)),
                  ],
                ),
                title: const Text('Nav Stack'),
                automaticallyImplyLeading: false,
              ),
              body: TabBarView(
                children: [
                  _Internal(items: _ascOrderData),
                  _Internal(
                    items: _descOrderData,
                    text: NavConstants.lastToFirst,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Internal extends StatelessWidget {
  const _Internal({
    Key key,
    @required this.items,
    this.text = NavConstants.firstToLast,
  }) : super(key: key);

  final List<String> items;
  final String text;

  @override
  Widget build(BuildContext context) {
    //

    return WidgetScreener(
      ratio: 1 / 2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Text(text, style: Theme.of(context).textTheme.headline5),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(
                height: 3,
                color: Colors.white,
              ),
              itemBuilder: (context, index) {
                //
                var _pageName = 'Home';

                if (items[index] != ApplevelConstants.homeRoute) {
                  _pageName = OptionAndRoutes.optionRoutes.keys.firstWhere(
                    (element) =>
                        OptionAndRoutes.optionRoutes[element] == items[index],
                  );
                }

                return Container(
                  height: 150,
                  color: HexColor.fromHex('#820263'),
                  child: Center(child: Text('$_pageName')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
