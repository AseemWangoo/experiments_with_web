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
                final _val = await jsutil.promiseToFuture<num>(linearModel(12));

                setState(() => _predictedValue = _val);
              },
              child: const Text('Linear Model'),
            ),
            Text('Predicted Value $_predictedValue'),
            OutlineButton(
              onPressed: () async {
                final _val = await jsutil
                    .promiseToFuture<List<Object>>(imageClassifier('img'));

                print(stringify(_val.first));
                print(objectKeys(_val.first));
                print(objectValues(_val.first));
                print(entries(_val.first));
                print(jsutil.hasProperty(_val.first, 'className'));
                print(jsutil.getProperty(_val.first, 'className'));
                print(jsutil.jsify(_val));

                print('Dart $_val');

                // final _temp = (_val.first as ImageResults).toMap();
                // print('Dart ${_temp}');
              },
              child: const Text('Image Classifier'),
            ),
          ],
        ),
      ),
    );
  }
}
