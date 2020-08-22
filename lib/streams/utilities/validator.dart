import 'dart:async';

import 'package:meta/meta.dart';

//**************** EXPOSED SECTION  *****************//

enum Validator { validateInt, validateDouble, validateString }

class ValidatorFactory {
  StreamTransformer<String, String> validation({@required Validator type}) =>
      _InputValidator(type).validation();
}

//**************** INTERNALS *****************//

abstract class _InputValidator {
  factory _InputValidator(Validator validatorType) {
    //
    switch (validatorType) {
      case Validator.validateInt:
        return _IntegerValidator();

      case Validator.validateDouble:
        return _DoubleValidator();

      case Validator.validateString:
        return _StringValidator();

      default:
        return _StringValidator();
    }
  }

  StreamTransformer<String, String> validation();
}

class _StringValidator implements _InputValidator {
  @override
  StreamTransformer<String, String> validation() =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (field, sink) {
          if (field.isNotEmpty) {
            sink.add(field);
          } else {
            sink.addError(_kErrorText);
          }
        },
      );

  static const String _kErrorText = 'Invalid input';
}

class _DoubleValidator implements _InputValidator {
  @override
  StreamTransformer<String, String> validation() =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (field, sink) {
          final _kDouble = double.tryParse(field);

          if (_kDouble != null && !_kDouble.isNegative) {
            sink.add(field);
          } else {
            sink.addError(_kErrorText);
          }
        },
      );

  static const String _kErrorText = 'Invalid input';
}

class _IntegerValidator implements _InputValidator {
  @override
  StreamTransformer<String, String> validation() =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (field, sink) {
          final _kInt = int.tryParse(field);

          if (_kInt != null && !_kInt.isNegative) {
            sink.add(field);
          } else {
            sink.addError(_kErrorText);
          }
        },
      );

  static const String _kErrorText = 'Invalid input';
}
