import 'package:experiments_with_web/bloc_example/api/github.api.dart';

import 'app_level/services/img_picker_service.dart';
import 'app_level/services/linker_service.dart';
import 'app_level/services/local_storage_service.dart';

import 'package:get_it/get_it.dart';

import 'app_level/services/hive/hive_operations.dart';
import 'app_level/services/navigation/navigation.dart';
import 'app_level/services/searches/search_operations.dart';
import 'bloc_example/bloc/search.bloc.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<LinkerService>(() => LinkerService());

  locator.registerLazySingleton<ImgPickerService>(() => ImgPickerService());

  locator.registerLazySingleton<LocalStorageService>(
    () => LocalStorageService(),
  );

  locator.registerLazySingleton<HiveOperationsService>(
    () => HiveOperationsService(),
  );

  locator.registerLazySingleton<SearchOperations>(() => SearchOperations());
  locator.registerLazySingleton(() => NavigationService());

  locator.registerLazySingleton<SearchBloc>(() => SearchBloc(GithubApi()));
}
