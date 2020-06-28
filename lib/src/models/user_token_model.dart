import 'package:flutter/material.dart';
import 'package:sintomed_app/src/models/user_model.dart';

class UserToken {
  User _user;
  String _token;

  UserToken({
    User user,
    String token,
  }) {
    this._user = user;
    this._token = token;
  }

  @protected
  User get user => _user;
  set user(User user) => _user = user;

  @protected
  String get token => _token;
  set token(String token) => _token = token;

  @protected
  UserToken.fromJson(Map<String, dynamic> json) {
    _user = json['user'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this._user;
    data['token'] = this._token;
    return data;
  }
}
