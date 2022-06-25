import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lectarium/core/base/base_service.dart';
import 'package:lectarium/core/models/course.dart';
import 'package:lectarium/core/models/user.dart';
import 'package:lectarium/core/services/navigator_service.dart';
import 'package:lectarium/core/utils.dart';

import 'lectarium_api_exception.dart';
import 'locator.dart';

class LectariumApi extends BaseService {
  static const String protocol = "https";
  static const String host = "lk.lectarium.ru";
  static const String apiPath = "wp-json/api/v1";
  static const String apiUrl = "$host/$apiPath";
  static const String _jwt_rejected = "auth_token_decode";
  final String _readable = 'GET';
  final String _creatable = 'POST';
  final Dio _client = Dio();

  LectariumApi._() : super(title: 'LectariumApiService');

  LectariumApi() : super(title: 'LectariumApiService');

  Future<dynamic> _request(
      {required String url,
      required String method,
      dynamic data,
      bool useAuth = false,
      String? authToken = '',
      String? typeAuth = ''}) async {
    try {
      if (method != _readable && method != _creatable) {
        throw const LectariumApiException('Недопустимые метод для запроса',
            LectariumApiException.unknownMethod);
      }

      bool checked = await _securityCheck(useAuth);

      if (checked) {
        throw const LectariumApiException('JWT токен истек или был удален',
            LectariumApiException.securityError);
      }

      Response resp;
      Map<String, dynamic> headers = <String, dynamic>{};

      if (useAuth == true) {
        headers['Authorization'] = '$typeAuth $authToken';
      }

      if (method == _readable) {
        resp = await _client.get('$protocol://$apiUrl/$url',
            queryParameters: data as Map<String, dynamic>,
            options: Options(
              headers: headers,
            ));
      } else {
        resp = await _client.post('$protocol://$apiUrl/$url',
            data: data,
            options: Options(
              headers: headers,
            ));
      }

      int respCode = resp.statusCode.toInt();

      if (respCode >= 400) {
        String respError = resp.data['data']['message'] as String;
        String respCodeStr = respCode.toString();

        throw LectariumApiException(
            'Код состояния HTTP с ошибкой. Код состояния: $respCodeStr. $respError',
            LectariumApiException.httpErrorCode);
      }

      return resp;
    } on DioError catch (de) {
      if (de.response != null) {
        dynamic msgCode = de.response.data['data']['message_code'];

        if (msgCode == _jwt_rejected) {
          await _logoutUser();
          return;
        }

        return de.response.data['data']['message'];
      }

      return de.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<void> _logoutUser() async {
    User currentUser = locator<User>();
    NavigatorService service = locator<NavigatorService>();

    currentUser.isAuth = false;
    currentUser.jwt = '';
    await currentUser.save();
    await service.navigateToWithReplacement('/login');
  }

  Future<bool> _securityCheck(bool needCheck) async {
    if (needCheck == false) {
      return false;
    }

    User currentUser = locator<User>();

    if (needCheck == true && isEmpty(currentUser.jwt)) {
      await _logoutUser();
      return true;
    }

    return false;
  }

  Future<dynamic> _get(
      {required String url, bool useAuth = false, dynamic data}) async {
    dynamic result = await _request(
        url: url,
        method: _readable,
        useAuth: useAuth,
        authToken: useAuth == true ? locator<User>().jwt : null,
        data: data);

    if (result is String) {
      log?.e(result);
      showGlobalError(result);
      return null;
    }

    return result as Response<dynamic>;
  }

  Future<dynamic> _post(
      {required String url, bool useAuth = false, dynamic data}) async {
    dynamic result = await _request(
        url: url,
        method: _creatable,
        useAuth: useAuth,
        authToken: useAuth == true ? locator<User>().jwt : null,
        data: data);

    if (result is String) {
      log?.e(result);
      showGlobalError(result);
      return null;
    }

    return result as Response<dynamic>;
  }

  Future<dynamic> fetchCourses() async {
    Response response;
    User user = locator<User>();

    response = await _get(url: 'courses', useAuth: true);

    if (!isEmpty(response)) {
      dynamic data = response.data['data'];
      user.courses = <String, Course>{};

      (data['courses'] as Map<String, dynamic>).forEach((key, value) {
        user.courses?[key] = Course.fromMap(value);
      });

      return true;
    }
    return false;
  }

  Future<dynamic> authUser(
      {String countrycode = "+7",
      String login = "",
      String password = ""}) async {
    Response response;

    if (login.isEmpty || password.isEmpty) return false;

    login = login.replaceFirst("+7", "");

    response = await _post(url: 'auth', data: <String, String>{
      "country_code": countrycode,
      "login": login,
      "password": password
    });

    if (!isEmpty(response)) {
      dynamic data = response.data['data'];

      if (data['auth'] == true) {
        User user = locator<User>();

        user = User.fromMap(data['user']);
        user.isAuth = true;
        await user.save();

        log?.i(user.toJson());

        return true;
      }
    }

    return false;
  }
}
