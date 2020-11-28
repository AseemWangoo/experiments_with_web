import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/wasm/utils/strings.dart';
import 'package:experiments_with_web/wasm/utils/wasm.loader.dart';

import 'package:flutter/material.dart';

class WasmScreen extends StatefulWidget {
  const WasmScreen({Key key}) : super(key: key);

  @override
  _WasmScreenState createState() => _WasmScreenState();
}

class _WasmScreenState extends State<WasmScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final loader = WasmLoader.loadFromAsset(WebAssets.wasmOpsMod);
    final isLoaded = await loader.initialized();
    if (isLoaded) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    //
    return CustomScaffold(
      enableDarkMode: true,
      titleText: WasmStrings.title,
    );
  }
}
