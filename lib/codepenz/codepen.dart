import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/image_loader.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/widget_iframer.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/widget_screen.dart';
import 'package:experiments_with_web/codepenz/implicitly.dart';
import 'package:experiments_with_web/codepenz/stack.dart';

import 'package:flutter/material.dart';

import 'layout.dart';

class CodepenScreen extends StatelessWidget {
  const CodepenScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showAppBar: false,
      // child: ImplicitlyAseem(),
      child: WidgetScreener(
        child: SizedBox(
          height: 800.0,
          child: WidgetIFramer(
            iframeSrc:
                'https://codepen.io/aseemwangoo/embed/RwrvvNx?theme-id=dark&default-tab=live,result',
          ),
        ),
      ),
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
