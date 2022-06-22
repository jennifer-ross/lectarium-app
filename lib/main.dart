import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:lectarium/core/size_config.dart';
import 'package:lectarium/views/dashboard/dashboard_view.dart';
import 'package:lectarium/views/login/login_view.dart';
import 'package:lectarium/views/signup/signup_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'dart:async';

import 'core/locator.dart';
import 'core/models/user.dart';
import 'core/providers.dart';
import 'core/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home/home_view.dart';

void main() async {
  await LocatorInjector.setupLocator();
  runApp(MainApplication());
}

class MainApplication extends StatelessWidget {
  final User user = locator<User>();

  MainApplication() {
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
                    theme: ThemeData(
                        fontFamily: "Suisse Intl",
                        primaryColor: Colors.white,
                        accentColor: Colors.black,
                        textTheme: TextTheme()),
                    navigatorKey: locator<NavigatorService>().navigatorKey,
                    home: !user.isAuth ? LoginView() : DashboardView(),
                    onGenerateRoute: (routeSettings) {
                      switch (routeSettings.name) {
                        case '/dashboard':
                          return PageTransition(
                              child: DashboardView(),
                              type: PageTransitionType.fade);
                        case '/login':
                          return PageTransition(
                              child: LoginView(),
                              type: PageTransitionType.fade);
                        case '/signup':
                          return PageTransition(
                              child: SignupView(),
                              type: PageTransitionType.fade);

                        default:
                          return PageTransition(
                              child:
                                  !user.isAuth ? LoginView() : DashboardView(),
                              type: PageTransitionType.fade);
                      }
                    },
                  ),
                );
              });
            });
          });
        });
  }
}
