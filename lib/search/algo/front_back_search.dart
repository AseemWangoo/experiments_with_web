class FrontBackSearch<T> {
  FrontBackSearch(this.input, this.searchTerm);

  /// Specify the input list.
  ///
  /// For instance,`[10, 20, 80, 30]`
  final List<T> input;

  /// Specify the search term.
  ///
  /// For instance, `10` in `[10, 20, 80, 30]`
  final T searchTerm;

  int get _inputSize => input.length;

  bool get isSearchFound {
    var frontIndex = 0;
    var backIndex = _inputSize - 1;

    while (frontIndex <= backIndex) {
      // Match found
      if (input[frontIndex] == searchTerm || input[backIndex] == searchTerm) {
        // print('Found !!');
        return true;
      }

      frontIndex++;
      backIndex--;

      // print('Iteration ${frontIndex}');
    }

    return false;
  }
}
