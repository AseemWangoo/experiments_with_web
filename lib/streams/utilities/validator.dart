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

  void validation() {}
}

class StringValidator implements InputValidator {
  @override
  void validation() {
    print('String');
  }
}

class DoubleValidator implements InputValidator {
  @override
  void validation() {
    print('Double');
  }
}

class IntegerValidator implements InputValidator {
  @override
  void validation() {
    print('Integer');
  }
}

void main() {
  // InputValidator(Validator.validateInt).validation();
  ValidatorFactory.validation(type: Validator.validateInt);
}

class ValidatorFactory {
  ValidatorFactory._();

  static void validation({@required Validator type}) {
    InputValidator(type).validation();
    return null;
  }
}
