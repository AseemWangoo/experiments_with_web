import 'dart:async';

import 'package:experiments_with_web/streams/utilities/validator.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class FormHooks with ValidatorFactory {
  FormHooks() {
    context = useContext();
    field1Controller = useStreamController<String>();
  }

  BuildContext context;

  // INPUT FIELD 1 (STRING)
  Stream<String> get field1Stream => field1Controller.stream.transform<String>(
        validation(type: Validator.validateString),
      );
  StreamController<String> field1Controller;
}
