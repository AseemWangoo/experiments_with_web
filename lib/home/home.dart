import 'package:experiments_with_web/app_level/styles/colors.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/nav_rail.dart';
import 'package:experiments_with_web/home/widgets/option_home.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: NavRail(
        optionWidgets: <Widget>[
          const OptionHome(),
          const Placeholder(),
        ],
      ),
    );
  }
}
