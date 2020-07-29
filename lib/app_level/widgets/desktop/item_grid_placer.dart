import 'package:flutter/material.dart';

class ItemGridPlacer extends StatelessWidget {
  const ItemGridPlacer({
    Key key,
    this.flex = 1,
    @required this.child,
    this.hasSideMargins = true,
  })  : assert(flex >= 1 && flex <= 7),
        super(key: key);

  /// This flex wlll be placed to the left and
  ///
  /// right of the child widget. The total ends up to`16`for desktop...
  /// ```dart
  /// I/P : ItemGridPlacer(flex:3, child: Text('Hiii'))
  /// O/P : Spacer(flex:3), Expanded(flex: 10, child), Spacer(flex:3)
  ///
  /// ```
  /// {@end-tool}
  final int flex;

  /// This will be the middle element for the`ItemGridPlacer`.
  final Widget child;

  final bool hasSideMargins;

  int get _calFlex {
    const _totalFlex = 16;
    final _times = 2 * flex;

    final _remFlex = _totalFlex - _times;
    return _remFlex;
  }

  @override
  Widget build(BuildContext context) {
    //

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (hasSideMargins) const SizedBox(width: 40.0),
        Spacer(flex: flex),
        Expanded(
          flex: _calFlex,
          child: child,
        ),
        Spacer(flex: flex),
        if (hasSideMargins) const SizedBox(width: 40.0),
      ],
    );
  }
}
