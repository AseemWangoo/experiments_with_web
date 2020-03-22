import 'package:experiments_with_web/app_level/constants/constants.dart';
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OptionButton(
                  buttonText: ApplevelConstants.option1,
                  onTap: () => _nav.pushNamed(ApplevelConstants.sampleRoute),
                ),
                OptionButton(
                  buttonText: ApplevelConstants.option2,
                  onTap: () => _nav.pushNamed(ApplevelConstants.googleRoute),
                ),
                OptionButton(
                  buttonText: ApplevelConstants.option3,
                  onTap: () => _nav.pushNamed(ApplevelConstants.iframeRoute),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
