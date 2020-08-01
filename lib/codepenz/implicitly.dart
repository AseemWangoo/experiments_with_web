import 'package:flutter/material.dart';

import 'dart:math' as math;

class ImplicitlyAseem extends StatefulWidget {
  const ImplicitlyAseem({Key key}) : super(key: key);

  @override
  _ImplicitlyAseemState createState() => _ImplicitlyAseemState();
}

class _ImplicitlyAseemState extends State<ImplicitlyAseem>
    with TickerProviderStateMixin {
  double _fontSize = 60.0;
  AlignmentGeometry _alignment = Alignment.center;
  double _opacity = 0.5;
  EdgeInsetsGeometry _padding = EdgeInsets.zero;
  double _elevation = 0.0;
  double _height = 72.0;
  bool _first = true;
  Tween<double> _tween = Tween<double>(begin: 0, end: 0);
  BorderRadius _radius = BorderRadius.all(Radius.circular(0.0));

  TextStyle get _textStyle => Theme.of(context).textTheme.headline2.copyWith(
        color: Colors.white70,
        decoration: TextDecoration.none,
      );

  TextStyle get _legendStyle => Theme.of(context).textTheme.bodyText1.copyWith(
        color: Colors.white,
        decoration: TextDecoration.none,
      );

  static const Duration _kTime = Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _init;
  }

  void get _init async {
    await Future.delayed(Duration(milliseconds: 1300));
    _separateMe;
    await Future.delayed(Duration(milliseconds: 1300));
    _uniteMe;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(5.0),
            color: Color(0xff05668d),
          ),
          Align(
            alignment: Alignment(0.0, -0.8),
            child: AnimatedCrossFade(
              duration: _kTime,
              firstChild: RaisedButton(
                color: Color(0xffdec4a1),
                child: Text('Separate me'.toUpperCase()),
                onPressed: () => _separateMe,
              ),
              secondChild: RaisedButton(
                color: Color(0xffdec4a1),
                child: Text('Unite me'.toUpperCase()),
                onPressed: () => _uniteMe,
              ),
              crossFadeState:
                  _first ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            ),
          ),
          AnimatedContainer(
            duration: _kTime,
            decoration: BoxDecoration(
              color: Color(0xff4e4d5c),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff533747),
                  blurRadius: 5.0,
                  offset: Offset(10.0, 15.0),
                )
              ],
              borderRadius: _radius,
            ),
            height: 400.0,
            padding: const EdgeInsets.all(80.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedDefaultTextStyle(
                  child: Text('A'),
                  style: _textStyle.copyWith(fontSize: _fontSize),
                  duration: _kTime,
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: _kTime,
                  child: _CustomText(name: 'N', textStyle: _textStyle),
                ),
                AnimatedOpacity(
                  opacity: _opacity,
                  duration: _kTime,
                  child: _CustomText(name: 'I', textStyle: _textStyle),
                ),
                AnimatedPadding(
                  padding: _padding,
                  duration: _kTime,
                  child: _CustomText(name: 'M', textStyle: _textStyle),
                ),
                AnimatedPhysicalModel(
                  child: _CustomText(name: 'AT', textStyle: _textStyle),
                  shape: BoxShape.rectangle,
                  elevation: _elevation,
                  color: Colors.transparent,
                  shadowColor: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  duration: _kTime,
                ),
                AnimatedSize(
                  curve: Curves.fastOutSlowIn,
                  duration: _kTime,
                  vsync: this,
                  child: Container(
                    child: _CustomText(name: 'I', textStyle: _textStyle),
                    height: _height,
                  ),
                ),
                TweenAnimationBuilder(
                  duration: _kTime,
                  tween: _tween,
                  builder: (_, double angle, __) {
                    return Transform.rotate(
                      angle: angle,
                      child: _CustomText(name: 'ON', textStyle: _textStyle),
                    );
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.95, 0.8),
            child: _CustomText(name: _legend, textStyle: _legendStyle),
          ),
        ],
      ),
    );
  }

  void get _separateMe => setState(() {
        _fontSize = 96.0;
        _alignment = Alignment.bottomCenter;
        _opacity = 1.0;
        _padding = EdgeInsets.only(right: 20.0);
        _elevation = 6.0;
        _height = 170.0;
        _first = false;
        _tween = Tween<double>(begin: 0, end: -math.pi / 2);
        _radius = BorderRadius.all(Radius.circular(30.0));
      });

  void get _uniteMe => setState(() {
        _fontSize = 60.0;
        _alignment = Alignment.center;
        _opacity = 0.5;
        _padding = EdgeInsets.zero;
        _elevation = 0.0;
        _height = 72.0;
        _first = true;
        _tween = Tween<double>(begin: 0, end: 0);
        _radius = BorderRadius.all(Radius.circular(0.0));
      });
}

class _CustomText extends StatelessWidget {
  const _CustomText({
    Key key,
    @required TextStyle textStyle,
    this.name = 'ANIMATION',
  })  : _textStyle = textStyle,
        super(key: key);

  final TextStyle _textStyle;
  final String name;

  @override
  Widget build(BuildContext context) => Text(name, style: _textStyle);
}

const String _legend = '''
Buttons : AnimatedCrossFade
Container : AnimatedContainer\n
A       : AnimatedDefaultTextStyle
N       : AnimatedAlign
I       : AnimatedOpacity
M       : AnimatedPadding
AT      : AnimatedPhysicalModel
I       : AnimatedSize
ON      : TweenAnimationBuilder
''';
