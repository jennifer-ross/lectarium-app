import 'package:flutter/animation.dart';
import 'package:lectarium/core/base/base_view_model.dart';

class SignupViewModel extends BaseViewModel {
  bool _obscurePassword = true;
  bool _show = false;
  AnimationController? _controller;
  String _password = "";
  String _login = "";

  bool get obscurePassword => _obscurePassword;

  set obscurePassword(bool obscurePassword) {
    _obscurePassword = obscurePassword;
  }

  bool get show => _show;

  set show(bool show) {
    _show = show;
  }

  AnimationController get controller => _controller!;

  set controller(AnimationController controller) {
    _controller = controller;
  }

  String get password => _password;

  set password(String password) {
    _password = password;
  }

  String get login => _login;

  set login(String login) {
    _login = login;
  }

  // Add ViewModel specific code here
}
