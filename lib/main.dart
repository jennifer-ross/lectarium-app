import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:lectarium/core/size_config.dart';
import 'package:lectarium/views/dashboard/dashboard_view.dart';
import 'package:lectarium/views/login/login_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'core/locator.dart';
import 'core/models/user.dart';
import 'core/providers.dart';
import 'core/services/navigator_service.dart';

void main() async {
  await LocatorInjector.setupLocator();
  runApp(MainApplication());
}

class MainApplication extends StatelessWidget {
  final User user = locator<User>();

  MainApplication({Key? key}) : super(key: key) {
    loading();
  }

  Future<bool> loading() async {
    await user.loadFromStorage();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loading(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return KeyboardVisibilityBuilder(
              builder: (context, isKeyBoadrdVisible) {
            SizeConfig.isKeyBoadrdVisible = isKeyBoadrdVisible;
            return LayoutBuilder(builder: (context, constraints) {
              return OrientationBuilder(builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);

                if (SizeConfig.isMobile) {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.portraitDown,
                  ]);
                }

                return MultiProvider(
                  providers: ProviderInjector.providers,
                  child: MaterialApp(
                    initialRoute: '/',
                    theme: ThemeData(
                        fontFamily: "Suisse Intl",
                        primaryColor: Colors.white,
                        accentColor: Colors.black,
                        textTheme: const TextTheme()),
                    navigatorKey: locator<NavigatorService>().navigatorKey,
                    scaffoldMessengerKey: locator
                        .get<GlobalKey<ScaffoldMessengerState>>('scaffold'),
                    home: !user.isAuth ? LoginView() : DashboardView(),
                    routes: generateRoutes(),
                  ),
                );
              });
            });
          });
        });
  }

  Map<String, WidgetBuilder> generateRoutes() {
    return <String, WidgetBuilder>{
      '/login': (BuildContext context) => LoginView(),
      '/dashboard': (BuildContext context) => DashboardView(),
    };
  }
}
