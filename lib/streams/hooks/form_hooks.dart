import 'dart:async';

import 'package:experiments_with_web/streams/utilities/validator.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

class FormHooks with ValidatorFactory {
  FormHooks() {
    context = useContext();
    field1Controller = useStreamController<String>();
    field2Controller = useStreamController<String>();
    field3Controller = useStreamController<String>();

    _saveForm = _FormSaveButton();
  }

  BuildContext context;

  // INPUT FIELD 1 (STRING)
  Stream<String> get field1Stream => field1Controller.stream.transform<String>(
        validation(type: Validator.validateString),
      );
  StreamController<String> field1Controller;

  // INPUT FIELD 2 (INTEGER)
  Stream<String> get field2Stream => field2Controller.stream.transform<String>(
        validation(type: Validator.validateInt),
      );
  StreamController<String> field2Controller;

  // INPUT FIELD 3 (DOUBLE)
  Stream<String> get field3Stream => field3Controller.stream.transform<String>(
        validation(type: Validator.validateDouble),
      );
  StreamController<String> field3Controller;

  // *************************** INTERNALS ***************************

  // IS FORM VALID
  Stream<bool> get isFormValid {
    // INCLUDE THE STREAMS YOU NEED TO VALIDATE
    _saveForm.listen([field1Stream, field2Stream, field3Stream]);

    return _saveForm.status;
  }

  _FormSaveButton _saveForm;
}

class _FormSaveButton {
  _FormSaveButton() {
    _controller = useStreamController<bool>();
  }

  List<bool> errors;
  Stream<bool> get status => _controller.stream;

  void listen(List<Stream> streams) {
    // SET ERRORS TO FALSE
    errors = List.generate(streams.length, (_) => false);

    List.generate(streams.length, (int index) {
      return streams[index].listen(
        (dynamic _) {
          errors[index] = false;
          _validate();
        },
        onError: (dynamic _) {
          errors[index] = true;
          _validate();
        },
      );
    });
  }

  void _validate() {
    final hasNoErrors =
        errors.firstWhere((bool b) => b == true, orElse: () => null) == null;
    _controller.add(hasNoErrors);
  }

  StreamController<bool> _controller;
}
