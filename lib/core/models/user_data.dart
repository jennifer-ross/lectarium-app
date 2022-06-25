// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserData {
  String? userLogin = '';
  String? userPass = '';
  String? userNicename = '';
  String? userEmail = '';
  String? userUrl = '';
  String? userRegistered = '';
  String? userActivationKey = '';
  String? userStatus = '';
  String? displayName = '';
  String? userFirstname = '';
  String? userLastname = '';
  String? nickname = '';
  String? userDescription = '';

  UserData({
    this.userLogin,
    this.userPass,
    this.userNicename,
    this.userEmail,
    this.userUrl,
    this.userRegistered,
    this.userActivationKey,
    this.userStatus,
    this.displayName,
    this.userFirstname,
    this.userLastname,
    this.nickname,
    this.userDescription,
  });

  UserData copyWith({
    String? userLogin,
    String? userPass,
    String? userNicename,
    String? userEmail,
    String? userUrl,
    String? userRegistered,
    String? userActivationKey,
    String? userStatus,
    String? displayName,
    String? userFirstname,
    String? userLastname,
    String? nickname,
    String? userDescription,
  }) {
    return UserData(
      userLogin: userLogin ?? this.userLogin,
      userPass: userPass ?? this.userPass,
      userNicename: userNicename ?? this.userNicename,
      userEmail: userEmail ?? this.userEmail,
      userUrl: userUrl ?? this.userUrl,
      userRegistered: userRegistered ?? this.userRegistered,
      userActivationKey: userActivationKey ?? this.userActivationKey,
      userStatus: userStatus ?? this.userStatus,
      displayName: displayName ?? this.displayName,
      userFirstname: userFirstname ?? this.userFirstname,
      userLastname: userLastname ?? this.userLastname,
      nickname: nickname ?? this.nickname,
      userDescription: userDescription ?? this.userDescription,
    );
  }

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
      userLogin: map['user_login'] != null ? map['user_login'] as String : null,
      userPass: map['user_pass'] != null ? map['user_pass'] as String : null,
      userNicename:
          map['user_nicename'] != null ? map['user_nicename'] as String : null,
      userEmail: map['user_email'] != null ? map['user_email'] as String : null,
      userUrl: map['user_url'] != null ? map['user_url'] as String : null,
      userRegistered: map['user_registered'] != null
          ? map['user_registered'] as String
          : null,
      userActivationKey: map['user_activationKey'] != null
          ? map['user_activationKey'] as String
          : null,
      userStatus:
          map['user_status'] != null ? map['user_status'] as String : null,
      displayName:
          map['display_name'] != null ? map['display_name'] as String : null,
      userFirstname: map['user_firstname'] != null
          ? map['user_firstname'] as String
          : null,
      userLastname:
          map['user_lastname'] != null ? map['user_lastname'] as String : null,
      nickname: map['nickname'] != null ? map['nickname'] as String : null,
      userDescription: map['user_description'] != null
          ? map['user_description'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserData(userLogin: $userLogin, userPass: $userPass, userNicename: $userNicename, userEmail: $userEmail, userUrl: $userUrl, userRegistered: $userRegistered, userActivationKey: $userActivationKey, userStatus: $userStatus, displayName: $displayName, userFirstname: $userFirstname, userLastname: $userLastname, nickname: $nickname, userDescription: $userDescription)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserData &&
        other.userLogin == userLogin &&
        other.userPass == userPass &&
        other.userNicename == userNicename &&
        other.userEmail == userEmail &&
        other.userUrl == userUrl &&
        other.userRegistered == userRegistered &&
        other.userActivationKey == userActivationKey &&
        other.userStatus == userStatus &&
        other.displayName == displayName &&
        other.userFirstname == userFirstname &&
        other.userLastname == userLastname &&
        other.nickname == nickname &&
        other.userDescription == userDescription;
  }

  @override
  int get hashCode {
    return userLogin.hashCode ^
        userPass.hashCode ^
        userNicename.hashCode ^
        userEmail.hashCode ^
        userUrl.hashCode ^
        userRegistered.hashCode ^
        userActivationKey.hashCode ^
        userStatus.hashCode ^
        displayName.hashCode ^
        userFirstname.hashCode ^
        userLastname.hashCode ^
        nickname.hashCode ^
        userDescription.hashCode;
  }
}
