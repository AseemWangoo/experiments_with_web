import 'package:flutter/rendering.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);

  TextStyle c(Color value) => copyWith(color: value);

  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);

  TextStyle size(double value) => copyWith(fontSize: value);

  TextStyle get u => copyWith(decoration: TextDecoration.underline);
}
