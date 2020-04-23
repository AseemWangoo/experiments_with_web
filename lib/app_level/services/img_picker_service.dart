// ignore_for_file: invalid_assignment,implicit_dynamic_variable

import 'dart:html';

class ImgPickerService {
  ImgPickerService();

  Future<Map<String, dynamic>> imgPicker() async {
    //
    final _data = <String, dynamic>{};
    final InputElement input = document.createElement('input');

    input
      ..type = 'file'
      ..multiple = false
      ..accept = 'image/*';

    input.click();
    await input.onChange.first;

    if (input.files.isNotEmpty) {
      final reader = FileReader();
      reader.readAsDataUrl(input.files.first);

      await reader.onLoadEnd.first;
      querySelector('#img').attributes['src'] = reader.result;

      final imgContent = reader.result as String;

      final _img = imgContent.replaceFirst(
        RegExp(r'data:image/[^;]+;base64,'),
        '',
      );

      _data['image'] = _img;
    }

    return _data;
  }
}
