import 'dart:convert';
import 'package:hupu/global.dart';

const String EventUserLogin = 'EventUserLogin';
const String EventUserLogout = 'EventUserLogout';

class UserManager {
  static UserManager _instance;
  static UserManager get instance {
    if (_instance == null) {
      _instance = UserManager();
      _instance.loadUserFromLocal();
    }
    return _instance;
  }

  User user;

  static User get currentUser {
    return UserManager.instance.user;
  }

  logout() {
    this.user = null;
    preferences.remove('user');
    //通知
  }

  login(Map<String, dynamic> userJson) {
    var user = User.fromJson(userJson);
    this.user = user;
    saveUser();
    //通知
  }

  bool get isLogin {
    return user != null;
  }

  loadUserFromLocal() {
    String userJson = preferences.getString('user');
    if (userJson != null) {
      user = User.fromJson(json.decode(userJson));
    }
  }

  void saveUser() async {
    var data = json.encode(user);
    preferences.setString('user', data);
  }
}

class User {
  String token;
  int id;
  String nickname;
  String avatarUrl;

  User.fromJson(Map json) {
    token = json['token'];
    id = json['id'];
    nickname = json['nickname'];
    avatarUrl = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'id': id,
      'nickname': nickname,
      'avatar': avatarUrl,
    };
  }
}
