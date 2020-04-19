import 'package:js/js_util.dart' as jsutil;

import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
import 'package:experiments_with_web/ml/utilities/linear_ml.dart';

import 'package:flutter/material.dart';

class MLScreen extends StatefulWidget {
  const MLScreen({Key key}) : super(key: key);

  @override
  _MLScreenState createState() => _MLScreenState();
}

class _MLScreenState extends State<MLScreen> {
  num _predictedValue = 0.0;

  @override
  Widget build(BuildContext context) {
    //

    return CustomScaffold(
      titleText: 'ML on Web',
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            OutlineButton(
              onPressed: () async {
                final _val =
                    await jsutil.promiseToFuture<num>(linearModel('text'));

                setState(() => _predictedValue = _val);
              },
              child: const Text('Linear Model'),
            ),
            Text('Predicted Value $_predictedValue'),
          ],
        ),
      ),
    );
  }
}
