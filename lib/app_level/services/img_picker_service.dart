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

  void imgTestPicker() {
    //
    final InputElement input = document.createElement('input');

    input
      ..type = 'file'
      ..multiple = false
      ..accept = 'image/*';

    input.onChange.listen((e) {
      final List<File> files = input.files;

      for (final file in files) {
        final reader = FileReader();

        reader.onLoadEnd.listen((event) {
          //
          final fileContent = reader.result;
          querySelector('#img').attributes['src'] = fileContent;
        });

        // reader.onLoad.listen((e2) {
        //   //

        //   final fileContent = reader.result;
        //   // print(fileContent);
        //   //
        // });
        // reader.readAsText(file);
        reader.readAsDataUrl(file);
        print('2. ${file.type}');
      }
    });
    input.click();
  }
}
