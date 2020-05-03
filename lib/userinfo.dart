import 'package:shared_preferences/shared_preferences.dart';
class UserInfo {
  final String token;
  final String username;
  final String name;

  UserInfo({this.token, this.username, this.name});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    
    return UserInfo(
      token: json['token'],
      username: json['username'],
      name: json['name'],
    );
  }



}
