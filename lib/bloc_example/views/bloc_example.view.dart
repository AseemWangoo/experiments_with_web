import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/bloc_example/utilities/strings.dart';

import 'package:flutter/material.dart';

class BlocExampleScreen extends StatelessWidget {
  const BlocExampleScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      titleText: BlocExampleStrings.title,
      enableDarkMode: true,
    );
  }
}
