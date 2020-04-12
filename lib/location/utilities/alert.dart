@JS()
library main;

import 'package:js/js.dart';

@JS('webAlert')
external void alert(dynamic text);

@JS('detectUserLocation')
external void detectUserLocation();
