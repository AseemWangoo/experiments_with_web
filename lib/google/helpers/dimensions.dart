import 'package:flutter_web/material.dart';

///Returns the width of the screen...
double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

///Returns the height of the screen...
double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

///Scaling the height...
double adjustHeight(double percentFactor, double height) {
  return height * percentFactor;
}

///Scaling the width...
double adjustWidth(double percentFactor, double width) {
  return width * percentFactor;
}
