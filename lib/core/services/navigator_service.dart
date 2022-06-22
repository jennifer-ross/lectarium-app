import 'package:lectarium/core/locator.dart';
import 'package:lectarium/core/models/user.dart';

import '../../core/base/base_service.dart';
import 'package:flutter/material.dart';

class NavigatorService extends BaseService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateToPage<T>(MaterialPageRoute<T> pageRoute) async {
    log?.i('navigateToPage: pageRoute: ${pageRoute.settings.name}');
    if (navigatorKey.currentState == null) {
      log?.e('navigateToPage: Navigator State is null');
    }
    return navigatorKey.currentState!.push(pageRoute);
  }

  Future<dynamic> navigateTo(String routeName) {
    log?.i('navigateToPage: pageRoute: $routeName');
    if (navigatorKey.currentState == null) {
      log?.e('navigateToPage: Navigator State is null');
    }
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  // Future<Future<T?>?> navigateToPageWithReplacement<T>(
  //     MaterialPageRoute<T> pageRoute) async {
  //   log?.i('navigateToPageWithReplacement: '
  //       'pageRoute: ${pageRoute.settings.name}');
  //   if (navigatorKey.currentState == null) {
  //     log?.e('navigateToPageWithReplacement: Navigator State is null');
  //     return null;
  //   }
  //   return navigatorKey.currentState!.pushReplacement(pageRoute);
  // }

  Future<dynamic> navigateToWithReplacement<T>(String routeName) async {
    log?.i('navigateToPageWithReplacement: '
        'pageRoute: $routeName');
    if (navigatorKey.currentState == null) {
      log?.e('navigateToPageWithReplacement: Navigator State is null');
    }
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  Future<dynamic> navigateToWithReplacementRemoveUntil<T>(
      String routeName) async {
    log?.i('navigateToPageWithReplacement: '
        'pageRoute: $routeName');
    if (navigatorKey.currentState == null) {
      log?.e('navigateToPageWithReplacement: Navigator State is null');
    }
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  void pop<T>([T? result]) {
    log?.i('goBack:');
    if (navigatorKey.currentState == null) {
      log?.e('goBack: Navigator State is null');
      return;
    }
    navigatorKey.currentState!.pop(result);
  }
}
