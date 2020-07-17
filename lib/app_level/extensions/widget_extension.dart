import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

extension WidgetModifier on Widget {
  /// Set the background color..
  Widget background(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
      ),
      child: this,
    );
  }

  /// Align a widget...
  Widget align([AlignmentGeometry alignment = Alignment.center]) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  /// Assign padding to a widget...
  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(16.0)]) {
    return Padding(
      padding: value,
      child: this,
    );
  }

  /// Expand a widget...
  Widget get expand {
    return Expanded(
      child: this,
    );
  }

  Widget get showCursor {
    return MouseRegion(
      cursor: MaterialStateMouseCursor.clickable,
      child: this,
    );
  }

  Widget clickable(void Function() action, {bool opaque = true}) {
    return GestureDetector(
      behavior: opaque ? HitTestBehavior.opaque : HitTestBehavior.deferToChild,
      onTap: action,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        opaque: opaque ?? false,
        child: this,
      ),
    );
  }
}
