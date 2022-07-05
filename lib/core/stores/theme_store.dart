import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

enum ThemeType { light, dark }

class ThemeStore = _ThemeStoreBase with _$ThemeStore;

abstract class _ThemeStoreBase with Store {
  final ThemeData _lightTheme = ThemeData.light().copyWith(
      textTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'SuisseIntl',
          ),
      primaryTextTheme: ThemeData.light().textTheme.apply(
            fontFamily: 'Suisse Intl',
          ));
  final ThemeData _darkTheme = ThemeData.dark().copyWith(
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'SuisseIntl',
          ),
      primaryTextTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'SuisseIntl',
          ));

  @computed
  ThemeData get currentThemeData =>
      currentThemeType == ThemeType.light ? _lightTheme : _darkTheme;

  @observable
  ThemeType currentThemeType = ThemeType.light;

  @computed
  String get themeString =>
      currentThemeType == ThemeType.light ? 'Light' : 'Dark';

  @action
  void changeCurrentTheme(ThemeType type) {
    currentThemeType = type;
  }
}
