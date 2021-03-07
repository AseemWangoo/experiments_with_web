import 'package:experiments_with_web/app_level/assets/assets.dart';
import 'package:experiments_with_web/app_level/extensions/textstyle_extension.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/column_spacer.dart';
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
  WasmLoader loader;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    loader = WasmLoader.loadFromAsset(WebAssets.wasmOps);
    final isLoaded = await loader.initialized();
    if (isLoaded) {
      setState(() {});
    }
  }

  double _sum;
  double _mult;

  TextStyle get _ts => Theme.of(context).textTheme.headline4.c(Colors.white);
  TextStyle get _ts5 => Theme.of(context).textTheme.headline5.c(Colors.white);

  @override
  Widget build(BuildContext context) {
    //

    return CustomScaffold(
      enableDarkMode: true,
      titleText: WasmStrings.title,
      child: ColumnSpacer(
        children: [
          const Spacer(),
          Text(WasmStrings.desc, style: _ts5, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () => _addition([1, 3]),
                icon: Icon(Icons.add),
                label: Text('Add 1,3'),
              ),
              if (_sum != null) Text('$_sum', style: _ts),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () => _multiply([2, 3]),
                icon: Icon(Icons.close),
                label: Text('Multiply 3,3'),
              ),
              if (_mult != null) Text('$_mult', style: _ts),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  // 'add' is the function defined in our wasm
  void _addition(List<int> input) {
    _sum = loader.callfunc('add', [1, 3]) as double;
    setState(() {});
  }

  // 'mult' is the function defined in our wasm
  void _multiply(List<int> input) {
    _mult = loader.callfunc('mult', [3, 3]);
    setState(() {});
  }
}
