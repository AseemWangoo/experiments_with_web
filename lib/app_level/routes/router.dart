import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/home.dart';
import 'package:experiments_with_web/game/game.dart';
import 'package:experiments_with_web/google/google.dart';
import 'package:experiments_with_web/iframe/iframe.dart';
import 'package:experiments_with_web/location/location.dart';
import 'package:experiments_with_web/ml/ml.dart';
import 'package:experiments_with_web/parallax/parallax.dart';
import 'package:experiments_with_web/sample/sample.dart';

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
