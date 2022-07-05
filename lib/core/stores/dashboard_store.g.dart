// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DashboardStore on _DashboardStoreBase, Store {
  late final _$currentCoursesAtom =
      Atom(name: '_DashboardStoreBase.currentCourses', context: context);

  @override
  ObservableList<Course> get currentCourses {
    _$currentCoursesAtom.reportRead();
    return super.currentCourses;
  }

  @override
  set currentCourses(ObservableList<Course> value) {
    _$currentCoursesAtom.reportWrite(value, super.currentCourses, () {
      super.currentCourses = value;
    });
  }

  late final _$fetchCoursesAsyncAction =
      AsyncAction('_DashboardStoreBase.fetchCourses', context: context);

  @override
  Future<void> fetchCourses() {
    return _$fetchCoursesAsyncAction.run(() => super.fetchCourses());
  }

  @override
  String toString() {
    return '''
currentCourses: ${currentCourses}
    ''';
  }
}
