@JS()
library main;

import 'package:js/js.dart';

@JS('learnLinear')
external num linearModel(int number);

@JS('classifyImage')
external List<Object> imageClassifier();

@JS('JSON.stringify')
external String stringify(Object obj);

@JS('Object.keys')
external List<String> objectKeys(Object obj);

@JS('Object.values')
external List<String> objectValues(Object obj);

@JS('Object.entries')
external List<String> entries(Object obj);

@JS('JSON.parse')
external ImageResults jsonObject(String str);

@JS()
@anonymous
class ImageResults {
  external factory ImageResults({
    String className,
    num probability,
  });

  external String get className;
  external num get probability;

  // Map<String, dynamic> toMap() {
  //   final _map = <String, dynamic>{
  //     'className': className,
  //     'probability': probability,
  //   };
  //   return _map;
  // }
}

List<ImageResults> listOfImageResults(List<Object> _val) {
  final _listOfMap = <ImageResults>[];

  for (final item in _val) {
    final _jsString = stringify(item);
    _listOfMap.add(jsonObject(_jsString));
  }

  return _listOfMap;
}
