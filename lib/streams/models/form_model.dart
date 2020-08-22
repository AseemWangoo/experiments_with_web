class FormData {
  String first;
  String second;
  String third;

  FormData({
    this.first = 'Aseem',
    this.second = '7',
    this.third = '0.5',
  });

  @override
  String toString() {
    return 'First: $first Second:$second Third:$third';
  }
}
