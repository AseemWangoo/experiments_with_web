import 'package:flutter/material.dart';

class AseemLayouted extends StatefulWidget {
  const AseemLayouted();
  @override
  _AseemLayoutedState createState() => _AseemLayoutedState();
}

class _AseemLayoutedState extends State<AseemLayouted>
    with TickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> _animation;

  double get _height => MediaQuery.of(context).size.height;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.decelerate),
    );
  }

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      backgroundColor: Color(0xff125e8a),
      body: Center(
        child: SizedBox(
          height: _height * 0.3,
          width: _height * 0.3,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (_, child) {
              if (_animation.value >= 0.4 && _animation.value <= 0.8) {
                return _genWidget(1);
              } else if (_animation.value > 0.8 && _animation.value <= 1.0) {
                return _genWidget(2);
              }

              return child;
            },
            child: _genWidget(0),
          ),
        ),
      ),
    );
  }

  Widget _genWidget(int key) {
    Widget _child;

    switch (key) {
      case 0:
        _child = _CustomWidget();
        break;

      case 1:
        _child = GridView.count(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(4, (index) {
            return _CustomWidget(index: (index + 1).toString());
          }),
        );
        break;

      case 2:
        _child = GridView.count(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(9, (index) {
            return _CustomWidget(index: (index + 1).toString());
          }),
        );
        break;
    }

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 700),
      transitionBuilder: (child, animation) => ScaleTransition(
        child: child,
        scale: animation,
      ),
      switchInCurve: Curves.easeInCubic,
      switchOutCurve: Curves.easeOut,
      child: Container(
        key: ValueKey<int>(key),
        child: _child,
      ),
    );
  }
}

class _CustomWidget extends StatelessWidget {
  const _CustomWidget({
    Key key,
    this.index = '1',
  }) : super(key: key);

  final String index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFc2b8b2),
      child: Align(
        alignment: AlignmentDirectional.center,
        child: Text(
          index,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
