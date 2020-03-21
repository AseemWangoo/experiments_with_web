import 'package:experiments_with_web/app_level/widgets/desktop/bg_widget.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/option_name.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      body: SafeArea(
        child: BgWidget(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OptionButton(
                      buttonText: 'Flipping',
                      onTap: () {},
                    ),
                    OptionButton(
                      buttonText: 'Inking',
                      onTap: () {},
                    ),
                    OptionButton(
                      buttonText: 'LiquidCards',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
