// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:localstorage/localstorage.dart';

import 'package:lectarium/core/models/course.dart';
import 'package:lectarium/core/models/user_data.dart';

class User {
  int? id = 0;
  String? name = '';
  int? blogId = 0;
  Map<String, dynamic>? caps = <String, bool>{};
  Map<String, String>? roles = <String, String>{};
  Map<String, dynamic>? allcaps = <String, bool>{};
  String? filter = '';
  String? jwt = '';
  UserData? data;
  bool isAuth = false;
  final LocalStorage _user_data = LocalStorage('user_data.json');
  Map<String, Course>? courses = <String, Course>{};

  User._();

  User(
      {this.id,
      this.name,
      this.blogId,
      this.caps,
      this.allcaps,
      this.filter,
      this.jwt,
      this.data,
      this.isAuth = false,
      this.courses,
      this.roles});

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
        // isAuth = loadedUser.isAuth;
        courses = loadedUser.courses;
        roles = loadedUser.roles;

        print(jwt);
      }
    });
  }

  User copyWith(
      {int? id,
      String? name,
      int? blogId,
      Map<String, dynamic>? caps,
      Map<String, dynamic>? allcaps,
      String? filter,
      String? jwt,
      UserData? data,
      bool? isAuth,
      Map<String, Course>? courses,
      Map<String, String>? roles}) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      blogId: blogId ?? this.blogId,
      caps: caps ?? this.caps,
      allcaps: allcaps ?? this.allcaps,
      filter: filter ?? this.filter,
      jwt: jwt ?? this.jwt,
      data: data ?? this.data,
      isAuth: isAuth ?? this.isAuth,
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
      'data': data?.toMap(),
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
      name: map['name'] != null ? map['name'] as String : null,
      blogId: map['blogId'] != null ? map['blogId'] as int : null,
      caps: map['caps'] != null
          ? Map<String, dynamic>.from(map['caps'] as Map<String, dynamic>)
          : null,
      allcaps: map['allcaps'] != null
          ? Map<String, dynamic>.from(map['allcaps'] as Map<String, dynamic>)
          : null,
      filter: map['filter'] != null ? map['filter'] as String : null,
      jwt: map['jwt'] != null ? map['jwt'] as String : null,
      data: map['data'] != null
          ? UserData.fromMap(map['data'] as Map<String, dynamic>)
          : null,
      isAuth: map['isAuth'] != null ? map['isAuth'] as bool : false,
      courses: map['courses'] != null
          ? Map<String, Course>.from(map['courses'] as Map<String, Course>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, name: $name, blogId: $blogId, caps: $caps, allcaps: $allcaps, filter: $filter, jwt: $jwt, data: $data, isAuth: $isAuth)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.blogId == blogId &&
        mapEquals(other.caps, caps) &&
        mapEquals(other.allcaps, allcaps) &&
        mapEquals(other.roles, roles) &&
        mapEquals(other.courses, courses) &&
        other.filter == filter &&
        other.jwt == jwt &&
        other.data == data &&
        other.isAuth == isAuth;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        blogId.hashCode ^
        caps.hashCode ^
        allcaps.hashCode ^
        filter.hashCode ^
        jwt.hashCode ^
        data.hashCode ^
        isAuth.hashCode;
  }
}
