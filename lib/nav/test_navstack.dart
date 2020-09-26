import 'nav_stack.dart';

// void main() {
//   Queue<String> _internal = Queue();

//   _internal.addLast('Hey');
//   _internal.addLast('there');
//   _internal.addLast('Aseem');

//   for (var i = 0; i < _internal.length; i++) {
//     print('>>>>>> ${_internal.elementAt(i)}');
//   }

//   print('\n\n');

//   for (var i = 0; i < _internal.length; i++) {
//     print('>>>>>> ${_internal.removeLast()}');
//   }

//   for (var i = 0; i < _internal.length; i++) {
//     print('>>>>>> ${_internal.elementAt(i)}');
//   }
// }

void main() {
  var _navStack = NavStack<String>();

  _navStack.push('Hey');
  _navStack.push('there');
  _navStack.push('Aseem');

  print('>>>> NS ${_navStack.length}');

  print('>>>>>> CURRENT TOP ${_navStack.top()}');

  print('Elements in stack ${_navStack.fetchAll().toString()}');

  _navStack.pop();
  print('Elements in stack ${_navStack.fetchAll().toString()}');

  _navStack.pop();
  print('Elements in stack ${_navStack.fetchAll().toString()}');

  _navStack.pop();
  print('Elements in stack ${_navStack.fetchAll().toString()}');
}
