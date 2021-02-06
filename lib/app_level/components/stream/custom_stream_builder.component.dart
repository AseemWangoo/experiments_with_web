import 'package:flutter/material.dart';

import 'package:provider/provider.dart' show Consumer, StreamProvider;

typedef WidgetBuilder<T> = Widget Function(BuildContext context, T model);

class CustomStreamBuilder<T> extends StatelessWidget {
  const CustomStreamBuilder({
    Key key,
    @required this.builder,
    @required this.stream,
    @required this.initialData,
    this.updateShouldNotify,
  }) : super(key: key);

  final WidgetBuilder<T> builder;

  final Stream<T> stream;

  final T initialData;

  final bool updateShouldNotify;

  @override
  Widget build(BuildContext context) {
    if (updateShouldNotify != null && updateShouldNotify) {
      return StreamProvider<T>.value(
        initialData: initialData,
        value: stream,
        updateShouldNotify: (prev, old) => updateShouldNotify,
        child: Consumer<T>(
          builder: (context, state, _) => builder(context, state),
        ),
      );
    }

    return StreamProvider<T>.value(
      initialData: initialData,
      value: stream,
      child: Consumer<T>(
        builder: (context, state, _) => builder(context, state),
      ),
    );
  }
}
