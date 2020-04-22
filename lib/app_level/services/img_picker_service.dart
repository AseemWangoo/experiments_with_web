// ignore_for_file: invalid_assignment,implicit_dynamic_variable

import 'dart:convert';
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
    List<int> _selectedFile = [];

    input
      ..type = 'file'
      ..multiple = true
      ..accept = 'image/*';

    input.onChange.listen((e) {
      final List<File> files = input.files;

      for (final file in files) {
        final reader = FileReader();

        reader.onLoadEnd.listen((event) {
          //
          final fileContent = reader.result;
          _selectedFile =
              Base64Decoder().convert(fileContent.toString().split(',').last);

          querySelector('#img').attributes['src'] = reader.result;
        });

        // reader.onLoad.listen((e2) {
        //   //

        //   final fileContent = reader.result;
        //   // print(fileContent);
        //   //
        // });
        // reader.readAsText(file);
        reader.readAsDataUrl(file);
        print('1. ${reader.result}');
        print('2. ${file.type}');
        print('3. $_selectedFile');
      }
    });
    input.click();
  }
}
