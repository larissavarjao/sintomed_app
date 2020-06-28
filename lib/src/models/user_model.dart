import 'package:flutter/material.dart';

class User {
  String _id;
  String _firstName;
  String _lastName;
  String _email;
  String _pacientName;
  String _createdAt;
  String _updatedAt;
  dynamic _deletedAt;

  User({
    String id,
    String firstName,
    String lastName,
    String email,
    String pacientName,
    String createdAt,
    String updatedAt,
    dynamic deletedAt,
  }) {
    this._id = id;
    this._firstName = firstName;
    this._lastName = lastName;
    this._email = email;
    this._pacientName = pacientName;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._deletedAt = deletedAt;
  }

  @protected
  String get id => _id;
  set id(String id) => _id = id;

  @protected
  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;

  @protected
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;

  @protected
  String get email => _email;
  set email(String email) => _email = email;

  @protected
  String get pacientName => _pacientName;
  set pacientName(String pacientName) => _pacientName = pacientName;

  @protected
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;

  @protected
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  @protected
  Null get deletedAt => _deletedAt;
  set deletedAt(Null deletedAt) => _deletedAt = deletedAt;

  @protected
  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _pacientName = json['pacientName'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['firstName'] = this._firstName;
    data['lastName'] = this._lastName;
    data['email'] = this._email;
    data['pacientName'] = this._pacientName;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    data['deletedAt'] = this._deletedAt;
    return data;
  }
}
