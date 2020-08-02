import 'package:experiments_with_web/app_level/extensions/widget_extension.dart';
import 'package:experiments_with_web/app_level/styles/colors.dart';
import 'package:experiments_with_web/app_level/utilities/screen_size.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scrollbar.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/item_grid_placer.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/row_spacer.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/scroller.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/sliver_scaffold.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/widget_screen.dart';
import 'package:experiments_with_web/codepenz/painter.dart';

import 'package:flutter/material.dart';

import 'implicitly.dart';
import 'layout.dart';
import 'stack.dart';

class CodepenScreen extends StatefulWidget {
  const CodepenScreen({Key key}) : super(key: key);

  @override
  _CodepenScreenState createState() => _CodepenScreenState();
}

class _CodepenScreenState extends State<CodepenScreen> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  double get _height => ScreenQueries.instance.height(context);
  static const _kScrollRatio = 0.85;

  @override
  Widget build(BuildContext context) {
    return CustomScrollbar(
      controller: _controller,
      child: Container(
        color: Colors.white70,
        child: SliverScaffold(
          controller: _controller,
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: _height * _kScrollRatio,
              child: WidgetScreener(
                child: SimpleSliverScaffold(
                  menu: _DemoMenu(),
                  children: [
                    _DemoContainer(color: const Color(0xFF36311f)),
                    _DemoContainer(color: const Color(0xFF7d8ca3)),
                    _DemoContainer(color: const Color(0xFF4f3130)),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              height: _height * _kScrollRatio,
              child: WidgetScreener(
                child: SliverScaffold(
                  controller: null,
                  menu: _DemoMenu(menuText: 'Disappear-header Sliver'),
                  children: [
                    _DemoContainer(color: const Color(0xFFd8bd8a)),
                    _DemoContainer(color: const Color(0xFFaa5042)),
                    _DemoContainer(color: const Color(0xFF753742)),
                  ],
                  statusBarChild: _OverTheMenu(),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              height: _height * _kScrollRatio,
              child: WidgetScreener(
                child: SliverAppbarScaffold(
                  children: [
                    _DemoContainer(color: const Color(0xFF8963ba)),
                    _DemoContainer(color: const Color(0xFFaa5042)),
                    _DemoContainer(color: const Color(0xFFff9f1c)),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              height: _height * _kScrollRatio,
              child: WidgetScreener(
                child: SliverPaddingScaffold(),
              ),
            ),
            ItemsScroller(
              children: [
                WidgetScreener(child: AseemPainted()),
                WidgetScreener(child: ImplicitlyAseem()),
                WidgetScreener(child: AseemLayouted()),
                WidgetScreener(child: AseemStack()),
              ],
            ),
          ],
          menu: _Menu(controller: _controller, ratio: _kScrollRatio),
          statusBarChild: _OverTheMenu(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

class _DemoContainer extends StatelessWidget {
  const _DemoContainer({Key key, this.color = const Color(0xFFf75c03)})
      : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    var _height = ScreenQueries.instance.height(context);

    return Container(color: color, height: _height * 0.4);
  }
}

class _DemoMenu extends StatelessWidget {
  const _DemoMenu({
    Key key,
    this.color = const Color(0xFFf75c03),
    this.menuText = 'Simple Sliver',
  }) : super(key: key);

  final Color color;
  final String menuText;

  TextStyle get _textStyle => TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        decoration: TextDecoration.none,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ItemGridPlacer(
        child: Text(menuText, style: _textStyle, textAlign: TextAlign.center),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({Key key, this.controller, double ratio})
      : _scrollRatio = ratio,
        super(key: key);

  final ScrollController controller;
  final double _scrollRatio;

  TextStyle get _textStyle => TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        decoration: TextDecoration.none,
      );

  @override
  Widget build(BuildContext context) {
    //
    var _height = ScreenQueries.instance.height(context);

    return DecoratedBox(
      decoration: BoxDecoration(color: AppColors.brandColor),
      child: ItemGridPlacer(
        child: RowSpacer(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Simple Sliver', style: _textStyle)
                .clickable(() => _scrollToItem(controller, 0.0)),
            Text('Sliver with Header', style: _textStyle)
                .clickable(() => _scrollToItem(controller, _height)),
            Text('Sliver Appbar', style: _textStyle)
                .clickable(() => _scrollToItem(controller, 2 * _height)),
            Text('Others', style: _textStyle)
                .clickable(() => _scrollToItem(controller, 3 * _height)),
            Text('Codepens', style: _textStyle)
                .clickable(() => _scrollToItem(controller, 4 * _height)),
          ],
          spacerWidget: const SizedBox(width: 24.0),
        ),
      ),
    );
  }

  void _scrollToItem(ScrollController _controller, [double multiplier = 0.0]) {
    _controller.animateTo(
      multiplier * _scrollRatio,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}

class _OverTheMenu extends StatelessWidget {
  const _OverTheMenu({Key key}) : super(key: key);

  TextStyle get _textStyle => TextStyle(
        color: Colors.white70,
        fontSize: 20.0,
        decoration: TextDecoration.none,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      alignment: Alignment.center,
      color: Color(0xff283D3B),
      child: Text('Fun with Slivers', style: _textStyle),
    );
  }
}

// child: WidgetScreener(
//         child: SizedBox(
//           height: 800.0,
//           child: WidgetIFramer(
//             iframeSrc:
//                 'https://codepen.io/aseemwangoo/embed/RwrvvNx?theme-id=dark&default-tab=live,result',
//           ),
//         ),
//       ),

// child: WidgetScreener(
//   child: SizedBox(
//     height: 800.0,
//     child: WidgetIFramer(
//       iframeSrc:
//           'https://codepen.io/aseemwangoo/embed/eYJLNjb?theme-id=dark&default-tab=live,result',
//     ),
//   ),
// ),

// WidgetScreener(
//   child: SizedBox(
//     height: 800.0,
//     child: WidgetIFramer(
//       iframeSrc:
//           'https://codepen.io/aseemwangoo/embed/qBbKJeq?theme-id=dark&default-tab=live,result',
//     ),
//   ),
// ),
