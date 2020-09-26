import 'package:flutter/material.dart';

class ListViewWithAllSeparators<T> extends StatelessWidget {
  const ListViewWithAllSeparators(
      {Key key, @required this.itemCount, @required this.itemBuilder})
      : super(key: key);

  final List<T> itemCount;
  final Widget Function(BuildContext context, T item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    //

    return ListView.separated(
      itemCount: itemCount.length + 2,
      separatorBuilder: (_, __) => const Divider(height: 0.5),
      itemBuilder: (context, index) {
        if (index == 0 || index == itemCount.length + 1) {
          return const SizedBox.shrink(); // zero height: not visible
        }
        return itemBuilder(context, itemCount[index - 1]);
      },
    );
  }
}
