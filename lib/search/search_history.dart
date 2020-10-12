import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:flutter/material.dart';

import 'utils/constants.dart';

class SearchHistory extends StatelessWidget {
  const SearchHistory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return CustomScaffold(
      enableDarkMode: true,
      titleText: SearchHistoryConsts.dtTitle,
    );
  }
}
