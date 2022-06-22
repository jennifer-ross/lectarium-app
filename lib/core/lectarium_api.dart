import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lectarium/core/models/course.dart';
import 'package:lectarium/core/models/user.dart';

import 'locator.dart';

class LectariumApi {
  static String host = "https://lk.lectarium.ru";
  static String apiPath = "wp-json/api/v1/";
  static String apiUrl = "$host/$apiPath";
  static Dio client = new Dio();

  LectariumApi() {}

  Future<dynamic> fetchCourses() async {
    Response response;
    User user = locator<User>();

    Map<String, dynamic> _headers = new Map<String, dynamic>();
    _headers['authorization'] = user.jwt;

    try {
      response = await client.get(apiUrl + "courses",
          options: Options(
            headers: _headers,
          ));
      if (response.statusCode.toInt() == 200) {
        dynamic data = response.data['data'];
        Map<String, dynamic> coursesArr = data['courses'];
        Map<String, Course> courses = new Map<String, Course>();

        coursesArr.forEach((key, value) {
          User author = new User();

          author.display_name = value['author_arg']['data']['display_name'];
          author.nicename = value['author_arg']['data']['user_nicename'];
          author.nickname = value['author_arg']['data']['user_login'];
          author.user_id = int.parse(value['author_arg']['data']['ID']);

          courses[key] = new Course(
              kartinka_kursa: value['kartinka_kursa'],
              course_progress: value['course_progress'],
              id: value['ID'],
              product_cat: value['product_cat'],
              month: value['month'],
              author_url: value['author_url'],
              kategoriya_kursa: value['kategoriya_kursa'],
              isFavorite: value['is_fav'],
              title: value['title'],
              author: author,
              current_last_openned_index: value['current_last_openned_index']);
        });

        user.courses = courses;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        return e.response.data['data']['message'];
      }

      return e.message;
    }

    return 'Что-то пошло не так...';
  }

  Future<dynamic> authUser(
      {String countrycode = "+7",
      String login = "",
      String password = ""}) async {
    Response response;

    if (login == null || password == null) return false;

    login = login.replaceFirst("+7", "");

    try {
      response = await client.get(apiUrl + "auth", queryParameters: {
        "country_code": countrycode,
        "login": login,
        "password": password
      });

      if (response.statusCode.toInt() == 200) {
        dynamic data = response.data['data'];

        if (data['auth'] == true) {
          User user = locator<User>();

          user.user_id = data['user_id'];
          user.jwt = data['jwt'];
          user.nicename = data['nicename'];
          user.nickname = data['nickname'];
          user.roles =
              (data['roles'] as Map<String, dynamic>).cast<String, String>();
          user.isAuth = true;

          await user.save();

          return true;
        }
      }
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response.data['data']['message_code'] == 'auth_login_empty') {
          return 'Заполните номер телефона';
        }
        if (e.response.data['data']['message_code'] == 'auth_pssword_empty') {
          return 'Заполните поле пароль';
        }
        return e.response.data['data']['message'];
      }

      return e.message;
    }

    return 'Что-то пошло не так...';
  }
}
