import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/wasm/utils/strings.dart';

import 'package:flutter/material.dart';

class WasmScreen extends StatelessWidget {
  const WasmScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return CustomScaffold(
      enableDarkMode: true,
      titleText: WasmStrings.title,
    );
  }
}
