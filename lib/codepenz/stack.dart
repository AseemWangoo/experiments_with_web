import 'package:flutter/material.dart';

class AseemStack extends StatefulWidget {
  const AseemStack();

  @override
  _AseemStackState createState() => _AseemStackState();
}

class _AseemStackState extends State<AseemStack> with TickerProviderStateMixin {
  //

  AnimationController _controller;

  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutQuad),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat(reverse: true);
        }
      });

    _controller.forward().orCancel;
  }

  TextStyle get _textStyle => TextStyle(
        color: Colors.white70,
        fontSize: 20.0,
        decoration: TextDecoration.none,
      );

  @override
  Widget build(BuildContext context) {
    //

    return SizedBox(
      child: Stack(
        children: <Widget>[
          FadeTransition(
            opacity: _animation,
            child: Container(
              padding: EdgeInsets.all(25),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.blue, Colors.red],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5.0),
            color: Color(0xff283D3B),
          ),
          FadeTransition(
            opacity: _animation,
            child: Container(
              alignment: Alignment(0.0, -0.4),
              margin: const EdgeInsets.all(80.0),
              color: Color(0xff197278),
              child: Text('I was Stacked !!', style: _textStyle),
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (_, child) {
              return Positioned.fill(
                child: child,
                top: _animation.value * 200.0,
                bottom: _animation.value * 200.0,
              );
            },
            child: Container(
              margin: const EdgeInsets.all(100.0),
              color: Color(0xff772e25),
              child: Center(
                child: Text(
                  'Hey, there !!',
                  style: _textStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
