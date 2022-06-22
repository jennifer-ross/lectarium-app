import 'package:flutter/animation.dart';
import 'package:lectarium/core/base/base_view_model.dart';
import 'package:lectarium/core/locator.dart';
import 'package:lectarium/core/services/navigator_service.dart';

class LoginViewModel extends BaseViewModel {
  bool _obscurePassword = true;
  bool _isLogin = false;
  bool _show = false;
  AnimationController? _controller;
  String _password = "";
  String _login = "";
  String? _countryCode;

  String get countryCode => _countryCode!;

  set countryCode(String countryCode) {
    _countryCode = countryCode;
  }

  String get login => _login;

  set login(String login) {
    _login = login;
  }

  String get password => _password;

  set password(String password) {
    _password = password;
  }

  bool get show => _show;

  set show(bool show) {
    _show = show;
  }

  AnimationController get controller => _controller!;

  set controller(AnimationController controller) {
    _controller = controller;
  }

  bool get isLogin => _isLogin;

  set isLogin(bool isLogin) {
    _isLogin = isLogin;
  }

  LoginViewModel({bool obscurePassword = true}) {
    this._obscurePassword = obscurePassword;
  }

  bool get obscurePassword => _obscurePassword;
  set obscurePassword(bool value) {
    this._obscurePassword = value;
    notifyListeners();
  }

  onLoginClick({Function? callback}) {
    locator<NavigatorService>()
        .navigateToWithReplacementRemoveUntil('/dashboard')
        .then((value) {
      if (controller != null) {
        controller.reverse().then((value) => show = false);
      }
    });
  }

  bool isValidMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{8,12}$)';
    RegExp regExp = new RegExp(pattern);

    if (value.length == 0) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }

    return true;
  }

  bool isValidPassword(String value) {
    if (value.length == 0) {
      return false;
    }

    return true;
  }

  // Add ViewModel specific code here
}
