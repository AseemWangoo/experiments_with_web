import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/extensions/hover_extension.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/bg_widget.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/option_name.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _nav = Navigator.of(context);

    return Scaffold(
      body: SafeArea(
        child: BgWidget(
          children: <Widget>[
            Wrap(
              alignment: WrapAlignment.end,
              spacing: 40.0,
              runSpacing: 20.0,
              children: [
                OptionButton(
                  buttonText: ApplevelConstants.option1,
                  onTap: () => _nav.pushNamed(ApplevelConstants.sampleRoute),
                ).showCursorOnHover,
                OptionButton(
                  buttonText: ApplevelConstants.option2,
                  onTap: () => _nav.pushNamed(ApplevelConstants.googleRoute),
                ).showCursorOnHover,
                OptionButton(
                  buttonText: ApplevelConstants.option3,
                  onTap: () => _nav.pushNamed(ApplevelConstants.iframeRoute),
                ).showCursorOnHover,
                OptionButton(
                  buttonText: ApplevelConstants.option4,
                  onTap: () => _nav.pushNamed(ApplevelConstants.parallaxRoute),
                ).showCursorOnHover,
                OptionButton(
                  buttonText: ApplevelConstants.option5,
                  onTap: () => _nav.pushNamed(ApplevelConstants.locationRoute),
                ).showCursorOnHover,
                OptionButton(
                  buttonText: ApplevelConstants.option6,
                  onTap: () => _nav.pushNamed(ApplevelConstants.mlRoute),
                ).showCursorOnHover,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
