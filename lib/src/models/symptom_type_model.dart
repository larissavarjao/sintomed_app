import 'package:flutter/material.dart';

class SymptomType {
  String _id;
  String _name;
  String _createdAt;
  String _updatedAt;
  String _deletedAt;

  SymptomType({
    String id,
    String name,
    String createdAt,
    String updatedAt,
    String deletedAt,
  }) {
    this._id = id;
    this._name = name;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._deletedAt = deletedAt;
  }

  @protected
  String get id => _id;
  set id(String id) => _id = id;

  @protected
  String get name => _name;
  set name(String name) => _name = name;

  @protected
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;

  @protected
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  @protected
  String get deletedAt => _deletedAt;
  set deletedAt(String deletedAt) => _deletedAt = deletedAt;

  SymptomType.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    data['deletedAt'] = this._deletedAt;
    return data;
  }
}
