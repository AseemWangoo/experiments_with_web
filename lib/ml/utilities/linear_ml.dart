@JS()
library main;

import 'package:js/js.dart';

@JS('learnLinear')
external num linearModel(int number);

@JS('classifyImage')
external List<Object> imageClassifier(dynamic img);

@JS('JSON.stringify')
external String stringify(Object obj);

class ImageResults {
  String className;
  num probability;

  Map<String, dynamic> toMap() {
    final _map = <String, dynamic>{
      'className': className,
      'probability': probability,
    };
    return _map;
  }
}
