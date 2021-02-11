import 'package:experiments_with_web/app_level/styles/colors.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/nav_rail.dart';
import 'package:experiments_with_web/home/screens/option_desktop.dart';
import 'package:experiments_with_web/home/screens/option_mobile.dart';

import 'package:flutter/material.dart';

import 'screens/option_fav.dart';
import 'screens/option_home.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: NavRail(
        optionWidgets: const <Widget>[
          OptionHome(),
          OptionFav(),
          OptionMobile(),
          OptionDesktop(),
        ],
      ),
    );
  }
}
