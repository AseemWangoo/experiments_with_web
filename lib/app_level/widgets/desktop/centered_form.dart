import 'package:flutter/material.dart';

class CenteredForm extends StatelessWidget {
  const CenteredForm({
    Key key,
    @required List<Widget> children,
  })  : assert(children != null),
        _children = children,
        super(key: key);

  final List<Widget> _children;

  @override
  Widget build(BuildContext context) {
    //
    final _widget = SingleChildScrollView(
      child: ListView.builder(
        itemCount: _children.length,
        itemBuilder: (_, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: _children[index],
          );
        },
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        shrinkWrap: true,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: _CenteredForm(widget: _widget),
    );
  }
}

class _CenteredForm extends StatelessWidget {
  const _CenteredForm({Key key, this.widget}) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Spacer(flex: 3),
        Expanded(child: widget, flex: 10),
        const Spacer(flex: 3),
      ],
    );
  }
}
