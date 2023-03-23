import 'package:dems1/prefernce_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dems1/ui/dashboard/dashboard_viewmodel.dart';

import 'api_base_service.dart';
import 'dialogue_service.dart';
import 'navigator_service.dart';

GetIt locator = GetIt.instance;

NavigationService get navigationService => locator<NavigationService>();

DialogService get dialogService => locator<DialogService>();
ApiBaseService get apiBaseService => locator<ApiBaseService>();
PreferenceService get preferenceService => locator<PreferenceService>();

void setupLocator() {
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => PreferenceService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiBaseService());
}
