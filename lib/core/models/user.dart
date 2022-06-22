import 'dart:convert';

import 'package:lectarium/core/models/course.dart';
import 'package:localstorage/localstorage.dart';

class User {
  int _user_id = 0;
  String _jwt = '';
  bool _isAuth = false;
  String _nickname = '';
  String _nicename = '';
  String _display_name = '';
  Map<String, dynamic> _roles = new Map<String, dynamic>();
  Map<String, Course>? _courses = <String, Course>{};
  final LocalStorage _user_data = new LocalStorage('user_data.json');

  Map<String, dynamic> get roles {
    return _roles;
  }

  Map<String, Course>? get courses => _courses;

  set roles(Map<String, dynamic> roles) {
    _roles = roles;
  }

  String get nicename => _nicename;

  set nicename(String nicename) {
    _nicename = nicename;
  }

  String get nickname => _nickname;

  set display_name(String display_name) {
    _display_name = display_name;
  }

  String get display_name => _display_name;

  set nickname(String nickname) {
    _nickname = nickname;
  }

  bool get isAuth => _isAuth;

  set isAuth(bool isAuth) {
    _isAuth = isAuth;
  }

  String get jwt => _jwt;

  set jwt(String jwt) {
    _jwt = jwt;
  }

  int get user_id => _user_id;

  set user_id(int user_id) {
    _user_id = user_id;
  }

  set courses(Map<String, Course>? courses) {
    _courses = courses;
  }

  User() {
    ;
  }

  Map toJson() {
    return {
      'user_id': user_id,
      'jwt': jwt,
      'isAuth': isAuth,
      'nickname': nickname,
      'nicename': nicename,
      'roles': jsonEncode(roles)
    };
  }

  static User fromJson(dynamic json) {
    User u = new User();

    u.user_id = json['user_id'] ?? 0;
    u.jwt = json['jwt'] ?? '';
    u.isAuth = json['isAuth'] ?? false;
    u.nickname = json['nickname'] ?? '';
    u.nicename = json['nicename'] ?? '';
    u.roles = jsonDecode(json['roles']);

    return u;
  }

  save() async {
    await _user_data.ready;

    await _user_data.ready.then((value) async {
      await _user_data.setItem('user_info', this.toJson());
    });
  }

  loadFromStorage() async {
    await _user_data.ready;

    await _user_data.ready!.then((value) {
      Map<dynamic, dynamic> user_info = _user_data.getItem('user_info');
      if (user_info != null && !user_info.isEmpty) {
        user_id = user_info['user_id'];
        jwt = user_info['jwt'];
        isAuth = user_info['isAuth'];
        nickname = user_info['nickname'];
        nicename = user_info['nicename'];
        roles = (jsonDecode(user_info['roles']) as Map<String, dynamic>)
            .cast<String, String>();

        print(user_info);
      }
    });
  }
}
