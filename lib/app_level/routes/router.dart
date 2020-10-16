import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/home/home.dart';
import 'package:experiments_with_web/codepenz/codepen.dart';
import 'package:experiments_with_web/data_table/data_table.dart';
import 'package:experiments_with_web/game/game.dart';
import 'package:experiments_with_web/google/google.dart';
import 'package:experiments_with_web/hooks/hooks.dart';
import 'package:experiments_with_web/iframe/iframe.dart';
import 'package:experiments_with_web/location/location.dart';
import 'package:experiments_with_web/ml/ml.dart';
import 'package:experiments_with_web/nav/nav.dart';
import 'package:experiments_with_web/parallax/parallax.dart';
import 'package:experiments_with_web/sample/sample.dart';
import 'package:experiments_with_web/search/search_history.dart';
import 'package:experiments_with_web/streams/stream_form.dart';
import 'package:experiments_with_web/using_selector/use_selector.dart';

import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //

      case ApplevelConstants.homeRoute:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const Home(),
          name: ApplevelConstants.homeRoute,
        );

      case ApplevelConstants.googleRoute:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const GoogleCloneScreen(),
          name: ApplevelConstants.googleRoute,
        );

      case ApplevelConstants.sampleRoute:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const SamplePage(),
          name: ApplevelConstants.sampleRoute,
        );

      case ApplevelConstants.iframeRoute:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const IframeScreen(),
          name: ApplevelConstants.iframeRoute,
        );

      case ApplevelConstants.parallaxRoute:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const ParallaxScreen(),
          name: ApplevelConstants.parallaxRoute,
        );

      case ApplevelConstants.locationRoute:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const LocationScreen(),
          name: ApplevelConstants.locationRoute,
        );

      case ApplevelConstants.mlRoute:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const MLScreen(),
          name: ApplevelConstants.mlRoute,
        );

      case ApplevelConstants.gameRoute:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const GameScreen(),
          name: ApplevelConstants.gameRoute,
        );

      case ApplevelConstants.dtRoute:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const DataTableScreen(),
          name: ApplevelConstants.dtRoute,
        );

      case ApplevelConstants.hooksRoute:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const HooksScreen(),
          name: ApplevelConstants.hooksRoute,
        );

      case ApplevelConstants.codepenRoute:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const CodepenScreen(),
          name: ApplevelConstants.codepenRoute,
        );

      case ApplevelConstants.streamsRoute:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const StreamForm(),
          name: ApplevelConstants.streamsRoute,
        );

      case ApplevelConstants.selectorsRoute:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const UseSelector(),
          name: ApplevelConstants.selectorsRoute,
        );

      case ApplevelConstants.visitedPagesRoute:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const VisitedScreens(),
          name: ApplevelConstants.visitedPagesRoute,
        );

      case ApplevelConstants.searchHistoryRoute:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const SearchHistory(),
          name: ApplevelConstants.searchHistoryRoute,
        );

      default:
        return _NoAnimationMaterialPageRoute<dynamic>(
          builder: (_) => const Home(),
          name: ApplevelConstants.homeRoute,
        );
    }
  }
}

class UndefinedView extends StatelessWidget {
  const UndefinedView({Key key, this.name}) : super(key: key);

  /// Name of the route....
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Something went wrong for $name'),
      ),
    );
  }
}

/// A MaterialPageRoute without any transition animations.
class _NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  _NoAnimationMaterialPageRoute({
    @required WidgetBuilder builder,
    @required String name,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          maintainState: maintainState,
          settings: RouteSettings(name: name),
          fullscreenDialog: fullscreenDialog,
        );

  // @override
  // Widget buildPage(
  //   BuildContext context,
  //   Animation<double> animation,
  //   Animation<double> secondaryAnimation,
  // ) {
  //   return builder(context);
  // }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) =>
      child;
}
