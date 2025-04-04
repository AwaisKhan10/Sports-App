import 'package:get_it/get_it.dart';
import 'package:sports_app/core/services/auth_services.dart';
import 'package:sports_app/core/services/database_services.dart';
import 'package:sports_app/core/services/file_picker.dart';
import 'package:sports_app/core/services/local_storage.dart';

import 'core/services/api_services.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  // final _instance = await LocalStorageService.getInstance();
  // locator.registerSingleton(_instance);
  locator.registerSingleton(AuthService());
  locator.registerSingleton(LocalStorageService());
  // locator.registerSingleton(NotificationsService());
  locator.registerSingleton(DatabaseServices());
  locator.registerSingleton(ApiServices());
  locator.registerLazySingleton(() => FilePickerService());
}
