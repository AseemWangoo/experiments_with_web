import 'package:experiments_with_web/app_level/services/img_picker_service.dart';
import 'package:experiments_with_web/app_level/services/linker_service.dart';
import 'package:experiments_with_web/app_level/services/local_storage_service.dart';

import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<LinkerService>(() => LinkerService());

  locator.registerLazySingleton<ImgPickerService>(() => ImgPickerService());

  locator.registerLazySingleton<LocalStorageService>(
    () => LocalStorageService(),
  );
}
