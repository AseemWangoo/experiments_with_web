@JS()
library main;

import 'package:js/js.dart';

@JS('learnLinear')
external num linearModel(int number);

@JS('classifyImage')
external Object imageClassifier(dynamic img);
