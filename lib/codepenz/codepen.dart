import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/styles/colors.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/image_loader.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/item_grid_placer.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/row_spacer.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/sliver_scaffold.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/widget_iframer.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/widget_screen.dart';
import 'package:experiments_with_web/codepenz/implicitly.dart';
import 'package:experiments_with_web/codepenz/stack.dart';

import 'package:flutter/material.dart';

import 'layout.dart';
import 'painter.dart';

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

  @override
  Widget build(BuildContext context) {
    // return CustomScaffold(
    //   showAppBar: false,
    //   child: WidgetScreener(
    //     child: ImplicitlyAseem(),
    //   ),
    // );
    return SliverScaffold(
      controller: _controller,
      children: [
        Placeholder(),
        Placeholder(),
      ],
      menu: _Menu(),
      statusBarChild: _OverTheMenu(),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

class _Menu extends StatelessWidget {
  const _Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: AppColors.brandColor),
      child: ItemGridPlacer(
        child: RowSpacer(
          children: const <Widget>[
            Text('1'),
            Text('1'),
            Text('1'),
            Text('1'),
          ],
          spacerWidget: const SizedBox(width: 24.0),
        ),
      ),
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
