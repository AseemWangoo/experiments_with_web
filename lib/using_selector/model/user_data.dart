import 'package:flutter/foundation.dart' show ChangeNotifier;

class UserData with ChangeNotifier {
  int _age;

  int get age => _age;

  set age(int age) {
    _age = age;
    notifyListeners();
  }

  String _name;

  String get name => _name;

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  String _emailAddress;

  String get emailAddress => _emailAddress;

  set emailAddress(String emailAddress) {
    _emailAddress = emailAddress;
    notifyListeners();
  }
}
