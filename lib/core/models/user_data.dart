// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'dart:convert';

import 'package:lectarium/core/base/base_model.dart';

class UserData extends BaseModel {
  String userLogin = '';
  String userPass = '';
  String userNicename = '';
  String userEmail = '';
  String userUrl = '';
  String userRegistered = '';
  String userActivationKey = '';
  String userStatus = '';
  String displayName = '';
  String userFirstname = '';
  String userLastname = '';
  String nickname = '';
  String userDescription = '';

  UserData._();

  UserData.withObject(UserData uData) {
    userLogin = uData.userLogin;
    userPass = uData.userPass;
    userNicename = uData.userNicename;
    userUrl = uData.userUrl;
    userRegistered = uData.userRegistered;
    userActivationKey = uData.userActivationKey;
    userStatus = uData.userStatus;
    displayName = uData.displayName;
    userFirstname = uData.userFirstname;
    userLastname = uData.userLastname;
    nickname = uData.nickname;
    userDescription = uData.userDescription;
  }

  UserData({
    this.userLogin = '',
    this.userPass = '',
    this.userNicename = '',
    this.userEmail = '',
    this.userUrl = '',
    this.userRegistered = '',
    this.userActivationKey = '',
    this.userStatus = '',
    this.displayName = '',
    this.userFirstname = '',
    this.userLastname = '',
    this.nickname = '',
    this.userDescription = '',
  });

  UserData copyWith({
    String userLogin = '',
    String userPass = '',
    String userNicename = '',
    String userEmail = '',
    String userUrl = '',
    String userRegistered = '',
    String userActivationKey = '',
    String userStatus = '',
    String displayName = '',
    String userFirstname = '',
    String userLastname = '',
    String nickname = '',
    String userDescription = '',
  }) {
    return UserData(
      userLogin: userLogin,
      userPass: userPass,
      userNicename: userNicename,
      userEmail: userEmail,
      userUrl: userUrl,
      userRegistered: userRegistered,
      userActivationKey: userActivationKey,
      userStatus: userStatus,
      displayName: displayName,
      userFirstname: userFirstname,
      userLastname: userLastname,
      nickname: nickname,
      userDescription: userDescription,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_login': userLogin,
      'user_pass': userPass,
      'user_nicename': userNicename,
      'user_email': userEmail,
      'user_url': userUrl,
      'user_registered': userRegistered,
      'user_activationKey': userActivationKey,
      'user_status': userStatus,
      'display_name': displayName,
      'user_firstname': userFirstname,
      'user_lastname': userLastname,
      'nickname': nickname,
      'user_description': userDescription,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      userLogin: map['user_login'] != null ? map['user_login'] as String : '',
      userPass: map['user_pass'] != null ? map['user_pass'] as String : '',
      userNicename:
          map['user_nicename'] != null ? map['user_nicename'] as String : '',
      userEmail: map['user_email'] != null ? map['user_email'] as String : '',
      userUrl: map['user_url'] != null ? map['user_url'] as String : '',
      userRegistered: map['user_registered'] != null
          ? map['user_registered'] as String
          : '',
      userActivationKey: map['user_activationKey'] != null
          ? map['user_activationKey'] as String
          : '',
      userStatus:
          map['user_status'] != null ? map['user_status'] as String : '',
      displayName:
          map['display_name'] != null ? map['display_name'] as String : '',
      userFirstname:
          map['user_firstname'] != '' ? map['user_firstname'] as String : '',
      userLastname:
          map['user_lastname'] != null ? map['user_lastname'] as String : '',
      nickname: map['nickname'] != null ? map['nickname'] as String : '',
      userDescription: map['user_description'] != null
          ? map['user_description'] as String
          : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      userLogin,
      userPass,
      userNicename,
      userEmail,
      userUrl,
      userRegistered,
      userActivationKey,
      userStatus,
      displayName,
      userFirstname,
      userLastname,
      nickname,
      userDescription,
    ];
  }
}
