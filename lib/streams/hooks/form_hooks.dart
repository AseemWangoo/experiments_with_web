import 'dart:async';

import 'package:experiments_with_web/streams/utilities/validator.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class FormHooks with ValidatorFactory {
  FormHooks() {
    context = useContext();
  }

  BuildContext context;

  // INPUT FIELD 1 (STRING)
  Stream<String> get field1Stream => field1Controller.stream.transform<String>(
        ValidatorFactory.validation(type: Validator.validateString),
      );
  StreamController<String> field1Controller;
}

void main() {
  print('Hii');
}
