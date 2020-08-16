import 'package:flutter/material.dart';

abstract class BaseRepository {
  final BuildContext context;

  BaseRepository([this.context]) {
    loadData();
    createData();
    updateData();
    deleteData();
  }

  Future<void> loadData();

  Future<dynamic> createData(dynamic);

  Future<dynamic> updateData();

  Future<dynamic> deleteData();
}
