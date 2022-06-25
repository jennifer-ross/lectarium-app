import 'package:flutter/material.dart';
import 'package:lectarium/core/base/base_view_model.dart';
import 'package:lectarium/core/locator.dart';
import 'package:lectarium/core/services/navigator_service.dart';

class HomeViewModel extends BaseViewModel {
  AnimationController? _controller;
  bool _show = false;

  AnimationController get controller => _controller!;

  set controller(AnimationController controller) {
    _controller = controller;
  }

  bool get show => _show;

  set show(bool show) {
    _show = show;
  }

  onLoginClick({Function? callback}) {
    locator<NavigatorService>().navigateTo('/login')?.then((value) {
      if (controller != null) {
        controller.reverse().then((value) => show = false);
      }
    });
  }

  onSignUpClick({Function? callback}) {
    locator<NavigatorService>().navigateTo('/signup')?.then((value) {
      if (controller != null) {
        controller.reverse().then((value) => show = false);
      }
    });
  }
}
