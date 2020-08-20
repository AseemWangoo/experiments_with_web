import 'dart:async';

import 'package:meta/meta.dart';

enum Validator { validateInt, validateDouble, validateString }

abstract class InputValidator {
  factory InputValidator(Validator validatorType) {
    //
    switch (validatorType) {
      case Validator.validateInt:
        return IntegerValidator();

      case Validator.validateDouble:
        return DoubleValidator();

      case Validator.validateString:
        return StringValidator();

      default:
        return StringValidator();
    }
  }

  StreamTransformer<String, String> validation();
}

class StringValidator implements InputValidator {
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

class DoubleValidator implements InputValidator {
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

class IntegerValidator implements InputValidator {
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

class ValidatorFactory {
  static StreamTransformer<String, String> validation(
          {@required Validator type}) =>
      InputValidator(type).validation();
}
