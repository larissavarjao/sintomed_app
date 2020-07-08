import 'package:flutter/material.dart';

class SymptomGeneric {
  String _id;
  String _name;
  String _description;
  String _classification;
  String _createdAt;
  String _updatedAt;
  String _deletedAt;

  SymptomGeneric({
    String id,
    String name,
    String description,
    String classification,
    String createdAt,
    String updatedAt,
    String deletedAt,
  }) {
    this._id = id;
    this._name = name;
    this._description = description;
    this._classification = classification;
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
  String get description => _description;
  set description(String description) => _description = description;

  @protected
  String get classification => _classification;
  set classification(String classification) => _classification = classification;

  @protected
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;

  @protected
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  @protected
  Null get deletedAt => _deletedAt;
  set deletedAt(Null deletedAt) => _deletedAt = deletedAt;

  SymptomGeneric.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _classification = json['classification'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['description'] = this._description;
    data['classification'] = this._classification;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    data['deletedAt'] = this._deletedAt;
    return data;
  }
}
