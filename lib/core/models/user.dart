// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';
import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:lectarium/core/base/base_model.dart';
import 'package:localstorage/localstorage.dart';

import 'package:lectarium/core/models/course.dart';
import 'package:lectarium/core/models/user_data.dart';

class User extends BaseModel {
  int id = 0;
  String name = '';
  int blogId = 0;
  Map<String, dynamic> caps = <String, bool>{};
  Map<String, String> roles = <String, String>{};
  Map<String, dynamic> allcaps = <String, bool>{};
  String filter = '';
  String jwt = '';
  late UserData data;
  bool isAuth = false;
  final LocalStorage _user_data = LocalStorage('user_data.json');
  Map<String, Course> courses = <String, Course>{};

  User._();

  User(
      {this.id = 0,
      this.name = '',
      this.blogId = 0,
      this.caps = const <String, bool>{},
      this.allcaps = const <String, bool>{},
      this.filter = '',
      this.jwt = '',
      this.isAuth = false,
      this.courses = const <String, Course>{},
      this.roles = const <String, String>{},
      required this.data});

  save() async {
    await _user_data.ready;

    await _user_data.ready.then((value) async {
      await _user_data.setItem('user_info', toJson());
    });
  }

  loadFromStorage() async {
    await _user_data.ready;

    await _user_data.ready.then((value) {
      Map<String, dynamic> user_info =
          jsonDecode(_user_data.getItem('user_info')) as Map<String, dynamic>;
      if (user_info != null && !user_info.isEmpty) {
        User loadedUser = User.fromMap(user_info);

        id = loadedUser.id;
        name = loadedUser.name;
        blogId = loadedUser.blogId;
        caps = loadedUser.caps;
        roles = loadedUser.roles;
        allcaps = loadedUser.allcaps;
        filter = loadedUser.filter;
        jwt = loadedUser.jwt;
        data = loadedUser.data;
        isAuth = loadedUser.isAuth;
        courses = loadedUser.courses;
        roles = loadedUser.roles;

        print(jwt);
      }
    });
  }

  User copyWith(
      {int id = 0,
      String name = '',
      int blogId = 0,
      Map<String, bool> caps = const <String, bool>{},
      Map<String, bool> allcaps = const <String, bool>{},
      String filter = '',
      String jwt = '',
      UserData? data,
      bool isAuth = false,
      Map<String, Course> courses = const <String, Course>{},
      Map<String, String> roles = const <String, String>{}}) {
    return User(
      id: id,
      name: name,
      blogId: blogId,
      caps: caps,
      allcaps: allcaps,
      filter: filter,
      jwt: jwt,
      data: data ?? UserData(),
      isAuth: isAuth,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'blogId': blogId,
      'caps': caps,
      'allcaps': allcaps,
      'filter': filter,
      'jwt': jwt,
      'data': data.toMap(),
      'isAuth': isAuth,
      'roles': roles,
      'courses': courses,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['ID'] != null
          ? map['ID'] is String
              ? int.parse(map['ID'])
              : (map['ID'] as int)
          : 0,
      name: map['name'] != null ? map['name'] as String : '',
      blogId: map['blogId'] != null ? map['blogId'] as int : 0,
      caps: map['caps'] != null
          ? Map<String, dynamic>.from(map['caps'] as Map<String, dynamic>)
          : const <String, bool>{},
      allcaps: map['allcaps'] != null
          ? Map<String, dynamic>.from(map['allcaps'] as Map<String, dynamic>)
          : const <String, bool>{},
      filter: map['filter'] != null ? map['filter'] as String : '',
      jwt: map['jwt'] != null ? map['jwt'] as String : '',
      data: map['data'] != null
          ? UserData.fromMap(map['data'] as Map<String, dynamic>)
          : UserData(),
      isAuth: map['isAuth'] != null ? map['isAuth'] as bool : false,
      courses: map['courses'] != null
          ? Map<String, Course>.from(map['courses'] as Map<String, dynamic>)
          : const <String, Course>{},
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      blogId,
      filter,
      jwt,
      isAuth,
      allcaps,
      courses,
      caps,
      data,
      roles,
    ];
  }
}
