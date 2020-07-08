// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptom_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SymptomStore on _SymptomStoreBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_SymptomStoreBase.loading'))
      .value;
  Computed<bool> _$errorComputed;

  @override
  bool get error => (_$errorComputed ??=
          Computed<bool>(() => super.error, name: '_SymptomStoreBase.error'))
      .value;
  Computed<bool> _$successComputed;

  @override
  bool get success => (_$successComputed ??= Computed<bool>(() => super.success,
          name: '_SymptomStoreBase.success'))
      .value;

  final _$symptomsAtom = Atom(name: '_SymptomStoreBase.symptoms');

  @override
  List<Symptom> get symptoms {
    _$symptomsAtom.reportRead();
    return super.symptoms;
  }

  @override
  set symptoms(List<Symptom> value) {
    _$symptomsAtom.reportWrite(value, super.symptoms, () {
      super.symptoms = value;
    });
  }

  final _$fetchSymptomsFutureAtom =
      Atom(name: '_SymptomStoreBase.fetchSymptomsFuture');

  @override
  ObservableFuture<List<Symptom>> get fetchSymptomsFuture {
    _$fetchSymptomsFutureAtom.reportRead();
    return super.fetchSymptomsFuture;
  }

  @override
  set fetchSymptomsFuture(ObservableFuture<List<Symptom>> value) {
    _$fetchSymptomsFutureAtom.reportWrite(value, super.fetchSymptomsFuture, () {
      super.fetchSymptomsFuture = value;
    });
  }

  final _$getSymptomsAsyncAction = AsyncAction('_SymptomStoreBase.getSymptoms');

  @override
  Future<dynamic> getSymptoms() {
    return _$getSymptomsAsyncAction.run(() => super.getSymptoms());
  }

  @override
  String toString() {
    return '''
symptoms: ${symptoms},
fetchSymptomsFuture: ${fetchSymptomsFuture},
loading: ${loading},
error: ${error},
success: ${success}
    ''';
  }
}
