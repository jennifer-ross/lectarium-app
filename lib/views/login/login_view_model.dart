import 'package:lectarium/core/base/base_view_model.dart';
import 'package:lectarium/core/lectarium_api.dart';
import 'package:lectarium/core/locator.dart';
import 'package:lectarium/core/services/navigator_service.dart';
import 'package:lectarium/core/utils.dart';

class LoginViewModel extends BaseViewModel {
  bool _obscurePassword = true;
  final String headTitle = 'Войдите в\nкабинет';
  final String subtitle =
      'Сотни прикладных курсов для профессионального роста, поддержка наставников и новые знакомства.\nПросто начните!';
  final String formTitle = 'Создайте свой профиль';
  final String buttonText = 'Вход';
  final String loginInputLabel = 'Email или номер мобильного';
  final String passwordInputLabel = 'Пароль';
  final LectariumApi api = locator<LectariumApi>();
  String loginValue = '';
  String passwordValue = '';

  LoginViewModel({bool obscurePassword = true}) {
    this._obscurePassword = obscurePassword;
  }

  bool get obscurePassword => _obscurePassword;
  set obscurePassword(bool value) {
    this._obscurePassword = value;
    notifyListeners();
  }

  Future<void> loginAction() async {
    dynamic isLogin =
        await api.authUser(login: loginValue, password: passwordValue);

    if (!isEmpty(isLogin) && isLogin == true) {
      await locator<NavigatorService>().navigateToWithReplacement('/dashboard');
    }
  }
}
