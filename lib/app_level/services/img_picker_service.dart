// ignore_for_file: invalid_assignment,implicit_dynamic_variable

import 'dart:html';

import 'package:image_picker_web/image_picker_web.dart';

class ImgPickerService {
  ImgPickerService();

  Future<File> imgPicker() async {
    final File _data = await ImagePickerWeb.getImage(
      outputType: ImageType.file,
    );

    return _data;
  }

  dynamic imgWidget() async {
    final _data = await ImagePickerWeb.getImage(
      outputType: ImageType.widget,
    );

    return _data;
  }

  void imgTestPicker() {
    //
    final InputElement input = document.createElement('input');

    input
      ..type = 'file'
      ..multiple = true
      ..accept = 'image/*';

    input.onChange.listen((e) {
      final List<File> files = input.files;
      for (final file in files) {
        final reader = FileReader();
        reader.onLoad.listen((e2) {
          //

          final fileContent = reader.result;
          // print(fileContent);
          //
        });
        // reader.readAsText(file);
        reader.readAsDataUrl(file);
        // querySelector('#img').attributes['src'] = reader.result;
        print(reader.result);
        print(file.type);
        // or '.readAsDataUrl' for using as img src, for example
      }
    });
    input.click();
  }
}
