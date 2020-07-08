import 'package:flutter/material.dart';

class Symptom {
  String _id;
  DateTime _happenedAt;
  int _durationSeconds;
  String _observation;
  String _userId;
  DateTime _createdAt;
  DateTime _updatedAt;
  dynamic _symptomGenericId;
  dynamic _symptomUserId;
  String _name;
  String _description;
  String _classification;
  String _typeId;
  String _typeName;

  Symptom({
    String id,
    DateTime happenedAt,
    int durationSeconds,
    String observation,
    String userId,
    DateTime createdAt,
    DateTime updatedAt,
    dynamic symptomGenericId,
    dynamic symptomUserId,
    String name,
    String description,
    String classification,
    String typeId,
    String typeName,
  }) {
    this._id = id;
    this._happenedAt = happenedAt;
    this._durationSeconds = durationSeconds;
    this._observation = observation;
    this._userId = userId;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
    this._symptomGenericId = symptomGenericId;
    this._symptomUserId = symptomUserId;
    this._name = name;
    this._description = description;
    this._classification = classification;
    this._typeId = typeId;
    this._typeName = typeName;
  }

  @protected
  String get id => _id;
  set id(String id) => _id = id;

  @protected
  DateTime get happenedAt => _happenedAt;
  set happenedAt(DateTime happenedAt) => _happenedAt = happenedAt;
  int get durationSeconds => _durationSeconds;

  @protected
  set durationSeconds(int durationSeconds) =>
      _durationSeconds = durationSeconds;

  @protected
  String get observation => _observation;
  set observation(String observation) => _observation = observation;

  @protected
  String get userId => _userId;
  set userId(String userId) => _userId = userId;

  @protected
  DateTime get createdAt => _createdAt;
  set createdAt(DateTime createdAt) => _createdAt = createdAt;

  @protected
  DateTime get updatedAt => _updatedAt;
  set updatedAt(DateTime updatedAt) => _updatedAt = updatedAt;

  @protected
  dynamic get symptomGenericId => _symptomGenericId;
  set symptomGenericId(dynamic symptomGenericId) =>
      _symptomGenericId = symptomGenericId;

  @protected
  dynamic get symptomUserId => _symptomUserId;
  set symptomUserId(dynamic symptomUserId) => _symptomUserId = symptomUserId;

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
  String get typeId => _typeId;
  set typeId(String typeId) => _typeId = typeId;

  @protected
  String get typeName => _typeName;
  set typeName(String typeName) => _typeName = typeName;

  Symptom.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _happenedAt = DateTime.parse(json['happenedAt']);
    _durationSeconds = json['durationSeconds'];
    _observation = json['observation'];
    _userId = json['userId'];
    _createdAt = DateTime.parse(json['createdAt']);
    _updatedAt = DateTime.parse(json['updatedAt']);
    _symptomGenericId = json['symptom_generic_id'];
    _symptomUserId = json['symptom_user_id'];
    _name = json['name'];
    _description = json['description'];
    _classification = json['classification'];
    _typeId = json['type_id'];
    _typeName = json['type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['happenedAt'] = this._happenedAt;
    data['durationSeconds'] = this._durationSeconds;
    data['observation'] = this._observation;
    data['userId'] = this._userId;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    data['symptom_generic_id'] = this._symptomGenericId;
    data['symptom_user_id'] = this._symptomUserId;
    data['name'] = this._name;
    data['description'] = this._description;
    data['classification'] = this._classification;
    data['type_id'] = this._typeId;
    data['type_name'] = this._typeName;
    return data;
  }
}
