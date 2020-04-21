// ignore_for_file: invalid_assignment

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
}
