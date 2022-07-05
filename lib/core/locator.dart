import 'package:flutter/material.dart';
import 'package:lectarium/core/lectarium_api.dart';
import 'package:lectarium/core/models/user.dart';
import 'package:lectarium/core/models/user_data.dart';
import 'package:lectarium/core/stores/dashboard_store.dart';
import 'package:lectarium/views/dashboard/dashboard_view.dart';
import 'package:lectarium/views/dashboard/dashboard_view_model.dart';
import 'package:lectarium/views/login/login_view_model.dart';

import '../core/logger.dart';
import '../core/services/navigator_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'stores/theme_store.dart';

GetIt locator = GetIt.instance;

class LocatorInjector {
  static final Logger _log = getLogger('LocatorInjector');

  static Future<void> setupLocator() async {
    _log.d('Initializing Services');
    locator.registerLazySingleton<LectariumApi>(() => LectariumApi());
    locator.registerSingleton<ThemeStore>(ThemeStore());
    locator.registerSingleton<DashboardStore>(DashboardStore());
    locator.registerLazySingleton(() => NavigatorService());
    locator.registerLazySingleton(() => LoginViewModel());
    locator.registerLazySingleton(() => DashboardViewModel());
    locator.registerSingleton<User>(User(data: UserData()));
    locator.registerSingleton(GlobalKey<ScaffoldMessengerState>(),
        instanceName: "scaffold");
  }
}
