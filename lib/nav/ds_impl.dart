import 'dart:collection';

class NavStack<T> implements _NavStack<T> {
  final ListQueue<T> _internal = ListQueue();

  int get length => _internal.length;

  bool get isEmpty => _internal.isEmpty;

  @override
  void pop() {
    if (_internal.isNotEmpty) {
      _internal.removeLast();
    }
  }

  @override
  void push(T val) {
    _internal.addLast(val);
  }

  @override
  T top() {
    return _internal.last;
  }

  @override
  List<T> fetchAll() {
    final _list = <T>[];

    for (var i = 0; i < length; i++) {
      _list.add(_internal.elementAt(i));
    }

    return _list;
  }

  @override
  void get clear => _internal.clear();
}

abstract class _NavStack<T> {
  void push(T val) {}

  void pop() {}

  T top();

  List<T> fetchAll();

  void get clear {}
}
