// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_generic_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SymptomGenericStore on _SymptomGenericStoreBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_SymptomGenericStoreBase.loading'))
      .value;
  Computed<bool> _$errorComputed;

  @override
  bool get error => (_$errorComputed ??= Computed<bool>(() => super.error,
          name: '_SymptomGenericStoreBase.error'))
      .value;
  Computed<bool> _$successComputed;

  @override
  bool get success => (_$successComputed ??= Computed<bool>(() => super.success,
          name: '_SymptomGenericStoreBase.success'))
      .value;

  final _$symptomsGenericsAtom =
      Atom(name: '_SymptomGenericStoreBase.symptomsGenerics');

  @override
  List<SymptomGeneric> get symptomsGenerics {
    _$symptomsGenericsAtom.reportRead();
    return super.symptomsGenerics;
  }

  @override
  set symptomsGenerics(List<SymptomGeneric> value) {
    _$symptomsGenericsAtom.reportWrite(value, super.symptomsGenerics, () {
      super.symptomsGenerics = value;
    });
  }

  final _$fetchSymptomsGenericsFutureAtom =
      Atom(name: '_SymptomGenericStoreBase.fetchSymptomsGenericsFuture');

  @override
  ObservableFuture<List<SymptomGeneric>> get fetchSymptomsGenericsFuture {
    _$fetchSymptomsGenericsFutureAtom.reportRead();
    return super.fetchSymptomsGenericsFuture;
  }

  @override
  set fetchSymptomsGenericsFuture(
      ObservableFuture<List<SymptomGeneric>> value) {
    _$fetchSymptomsGenericsFutureAtom
        .reportWrite(value, super.fetchSymptomsGenericsFuture, () {
      super.fetchSymptomsGenericsFuture = value;
    });
  }

  final _$getSymptomsGenericsAsyncAction =
      AsyncAction('_SymptomGenericStoreBase.getSymptomsGenerics');

  @override
  Future<dynamic> getSymptomsGenerics() {
    return _$getSymptomsGenericsAsyncAction
        .run(() => super.getSymptomsGenerics());
  }

  @override
  String toString() {
    return '''
symptomsGenerics: ${symptomsGenerics},
fetchSymptomsGenericsFuture: ${fetchSymptomsGenericsFuture},
loading: ${loading},
error: ${error},
success: ${success}
    ''';
  }
}
