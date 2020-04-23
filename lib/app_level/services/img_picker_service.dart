// ignore_for_file: invalid_assignment,implicit_dynamic_variable

import 'dart:html';

import 'package:image_picker_web/image_picker_web.dart';

class ImgPickerService {
  ImgPickerService();

  dynamic imgWidget() async {
    final _data = await ImagePickerWeb.getImage(
      outputType: ImageType.widget,
    );

    return _data;
  }

  Future<void> imgPicker() async {
    //
    final InputElement input = document.createElement('input');

    input
      ..type = 'file'
      ..multiple = false
      ..accept = 'image/*';

    input.click();
    await input.onChange.first;

    if (input.files.isEmpty) {
      return null;
    } else {
      final reader = FileReader();
      reader.readAsDataUrl(input.files.first);

      await reader.onLoadEnd.first;
      final imgContent = reader.result;

      querySelector('#img').attributes['src'] = imgContent;
    }
  }
}
