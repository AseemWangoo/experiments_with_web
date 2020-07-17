import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/extensions/hover_extension.dart';
import 'package:experiments_with_web/app_level/extensions/widget_extension.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/bg_widget.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/option_name.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/parallax_btn.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  static final _optionAndRoute = OptionAndRoutes.optionRoutes.entries;

  @override
  Widget build(BuildContext context) {
    //
    final _nav = Navigator.of(context);

    return Scaffold(
      body: SafeArea(
        child: BgWidget(
          showAnim: false,
          children: <Widget>[
            Wrap(
              alignment: WrapAlignment.end,
              spacing: 40.0,
              runSpacing: 20.0,
              children: [
                for (MapEntry<String, String> _optionRoute
                    in _optionAndRoute) ...[
                  // OptionButton(
                  //   buttonText: _optionRoute.key,
                  //   onTap: () => _nav.pushNamed(_optionRoute.value),
                  // ).showCursorOnHover
                  ParallaxButton(
                    text: _optionRoute.key,
                  ).clickable(() => _nav.pushNamed(_optionRoute.value)),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
