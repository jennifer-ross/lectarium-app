// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeStore on _ThemeStoreBase, Store {
  Computed<ThemeData>? _$currentThemeDataComputed;

  @override
  ThemeData get currentThemeData => (_$currentThemeDataComputed ??=
          Computed<ThemeData>(() => super.currentThemeData,
              name: '_ThemeStoreBase.currentThemeData'))
      .value;
  Computed<String>? _$themeStringComputed;

  @override
  String get themeString =>
      (_$themeStringComputed ??= Computed<String>(() => super.themeString,
              name: '_ThemeStoreBase.themeString'))
          .value;

  late final _$currentThemeTypeAtom =
      Atom(name: '_ThemeStoreBase.currentThemeType', context: context);

  @override
  ThemeType get currentThemeType {
    _$currentThemeTypeAtom.reportRead();
    return super.currentThemeType;
  }

  @override
  set currentThemeType(ThemeType value) {
    _$currentThemeTypeAtom.reportWrite(value, super.currentThemeType, () {
      super.currentThemeType = value;
    });
  }

  late final _$_ThemeStoreBaseActionController =
      ActionController(name: '_ThemeStoreBase', context: context);

  @override
  void changeCurrentTheme(ThemeType type) {
    final _$actionInfo = _$_ThemeStoreBaseActionController.startAction(
        name: '_ThemeStoreBase.changeCurrentTheme');
    try {
      return super.changeCurrentTheme(type);
    } finally {
      _$_ThemeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentThemeType: ${currentThemeType},
currentThemeData: ${currentThemeData},
themeString: ${themeString}
    ''';
  }
}
