// ignore_for_file: invalid_assignment

import 'package:experiments_with_web/app_level/services/img_picker_service.dart';
import 'package:experiments_with_web/locator.dart';

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
  List<ImageResults> _listOfMap = <ImageResults>[];
  Image pickedImage;

  static final _imgService = locator<ImgPickerService>();

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
                pickedImage = await _imgService.imgWidget();
                setState(() {});
              },
              child: const Text('Show Image'),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeIn,
              child: SizedBox(
                    width: 200.0,
                    child: pickedImage,
                  ) ??
                  Container(),
            ),
            OutlineButton(
              onPressed: () async {
                _imgService.imgPicker();
              },
              child: const Text('Select Image'),
            ),
            OutlineButton(
              onPressed: () async {
                final _val = await jsutil
                    .promiseToFuture<List<Object>>(imageClassifier());

                setState(() => _listOfMap = listOfImageResults(_val));
              },
              child: const Text('Feature Extraction'),
            ),
            for (final _item in _listOfMap) ...[
              Text('ClassName : ${_item.className}'),
              Text('Probability : ${_item.probability}\n'),
            ]
          ],
        ),
      ),
    );
  }
}
