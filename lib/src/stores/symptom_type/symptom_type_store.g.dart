// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_type_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SymptomTypeStore on _SymptomTypeStoreBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_SymptomTypeStoreBase.loading'))
      .value;
  Computed<bool> _$errorComputed;

  @override
  bool get error => (_$errorComputed ??= Computed<bool>(() => super.error,
          name: '_SymptomTypeStoreBase.error'))
      .value;
  Computed<bool> _$successComputed;

  @override
  bool get success => (_$successComputed ??= Computed<bool>(() => super.success,
          name: '_SymptomTypeStoreBase.success'))
      .value;

  final _$symptomsTypesAtom = Atom(name: '_SymptomTypeStoreBase.symptomsTypes');

  @override
  List<SymptomType> get symptomsTypes {
    _$symptomsTypesAtom.reportRead();
    return super.symptomsTypes;
  }

  @override
  set symptomsTypes(List<SymptomType> value) {
    _$symptomsTypesAtom.reportWrite(value, super.symptomsTypes, () {
      super.symptomsTypes = value;
    });
  }

  final _$fetchSymptomsTypesFutureAtom =
      Atom(name: '_SymptomTypeStoreBase.fetchSymptomsTypesFuture');

  @override
  ObservableFuture<List<SymptomType>> get fetchSymptomsTypesFuture {
    _$fetchSymptomsTypesFutureAtom.reportRead();
    return super.fetchSymptomsTypesFuture;
  }

  @override
  set fetchSymptomsTypesFuture(ObservableFuture<List<SymptomType>> value) {
    _$fetchSymptomsTypesFutureAtom
        .reportWrite(value, super.fetchSymptomsTypesFuture, () {
      super.fetchSymptomsTypesFuture = value;
    });
  }

  final _$getSymptomsTypesAsyncAction =
      AsyncAction('_SymptomTypeStoreBase.getSymptomsTypes');

  @override
  Future<dynamic> getSymptomsTypes() {
    return _$getSymptomsTypesAsyncAction.run(() => super.getSymptomsTypes());
  }

  @override
  String toString() {
    return '''
symptomsTypes: ${symptomsTypes},
fetchSymptomsTypesFuture: ${fetchSymptomsTypesFuture},
loading: ${loading},
error: ${error},
success: ${success}
    ''';
  }
}
