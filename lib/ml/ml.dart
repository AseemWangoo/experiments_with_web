// ignore_for_file: invalid_assignment

import 'dart:convert';
import 'dart:typed_data';

import 'package:experiments_with_web/app_level/services/img_picker_service.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/custom_drawer.dart';
import 'package:experiments_with_web/locator.dart';
import 'package:experiments_with_web/ml/utilities/constants.dart';

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
  Map<String, dynamic> _imgData = <String, dynamic>{};
  Uint8List imageData;

  static final _imgService = locator<ImgPickerService>();

  @override
  Widget build(BuildContext context) {
    //

    return CustomScaffold(
      titleText: 'ML on Web',
      showDrawer: true,
      drawerChild: CustomDrawer(
        medium: MLConstants.medium,
        youtubeLink: MLConstants.youtube,
        website: MLConstants.website,
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('Formula (2x - 1)'),
              OutlinedButton(
                onPressed: () async {
                  final _val =
                      await jsutil.promiseToFuture<num>(linearModel(12));

                  setState(() => _predictedValue = _val);
                },
                child: const Text('Linear Model x=12'),
              ),
              Text('Predicted Value $_predictedValue'),
              OutlinedButton(
                onPressed: () async {
                  _imgData = await _imgService.imgPicker();

                  imageData = base64.decode(_imgData['image'] as String);

                  if (_listOfMap.isNotEmpty) {
                    _listOfMap.clear();
                  }

                  setState(() {});
                },
                child: const Text('Select Image'),
              ),
              if (imageData != null) ...[
                SizedBox(
                  width: 300.0,
                  child: Image.memory(imageData),
                )
              ],
              OutlinedButton(
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
      ),
    );
  }
}
