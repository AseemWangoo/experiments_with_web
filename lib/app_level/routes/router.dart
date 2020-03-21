import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //

      // case ApplevelConstants.homeRoute:
      //   return _NoAnimationMaterialPageRoute<dynamic>(
      //     builder: (_) => const Home(),
      //     name: ApplevelConstants.homeRoute,
      //   );

      // default:
      //   return _NoAnimationMaterialPageRoute<dynamic>(
      //     builder: (_) => const Home(),
      //     name: ApplevelConstants.homeRoute,
      //   );
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
