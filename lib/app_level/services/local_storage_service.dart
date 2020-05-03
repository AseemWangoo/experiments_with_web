import 'dart:html' as html;

class LocalStorageService {
  LocalStorageService();

  void saveKeyValue(String key, String value) {
    final _localStorage = html.window.localStorage;

    if (_localStorage.containsKey(key)) {
      _localStorage['$key'] = value;
    } else {
      _localStorage.putIfAbsent(key, () => value);
    }
  }

  void get clear {
    final _localStorage = html.window.localStorage;
    _localStorage.clear();
  }

  void removeKey(String key) {
    final _localStorage = html.window.localStorage;
    _localStorage.remove(key);
  }

  // Null means doesn't exist
  Future<String> fetchValue(String key) async {
    final _localStorage = html.window.localStorage;
    return _localStorage['$key'];
  }
}
