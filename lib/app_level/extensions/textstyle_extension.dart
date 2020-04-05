import 'package:flutter/rendering.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);

  TextStyle c(Color value) => copyWith(color: value);
}
