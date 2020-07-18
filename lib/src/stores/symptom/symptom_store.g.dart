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

  final _$happenedAtAtom = Atom(name: '_SymptomStoreBase.happenedAt');

  @override
  DateTime get happenedAt {
    _$happenedAtAtom.reportRead();
    return super.happenedAt;
  }

  @override
  set happenedAt(DateTime value) {
    _$happenedAtAtom.reportWrite(value, super.happenedAt, () {
      super.happenedAt = value;
    });
  }

  final _$durationSecondsAtom = Atom(name: '_SymptomStoreBase.durationSeconds');

  @override
  int get durationSeconds {
    _$durationSecondsAtom.reportRead();
    return super.durationSeconds;
  }

  @override
  set durationSeconds(int value) {
    _$durationSecondsAtom.reportWrite(value, super.durationSeconds, () {
      super.durationSeconds = value;
    });
  }

  final _$observationAtom = Atom(name: '_SymptomStoreBase.observation');

  @override
  String get observation {
    _$observationAtom.reportRead();
    return super.observation;
  }

  @override
  set observation(String value) {
    _$observationAtom.reportWrite(value, super.observation, () {
      super.observation = value;
    });
  }

  final _$symptomGenericIdAtom =
      Atom(name: '_SymptomStoreBase.symptomGenericId');

  @override
  String get symptomGenericId {
    _$symptomGenericIdAtom.reportRead();
    return super.symptomGenericId;
  }

  @override
  set symptomGenericId(String value) {
    _$symptomGenericIdAtom.reportWrite(value, super.symptomGenericId, () {
      super.symptomGenericId = value;
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

  final _$onChangeHappenedAtAsyncAction =
      AsyncAction('_SymptomStoreBase.onChangeHappenedAt');

  @override
  Future<dynamic> onChangeHappenedAt(DateTime happenedAt) {
    return _$onChangeHappenedAtAsyncAction
        .run(() => super.onChangeHappenedAt(happenedAt));
  }

  final _$onChangeDurationAsyncAction =
      AsyncAction('_SymptomStoreBase.onChangeDuration');

  @override
  Future<dynamic> onChangeDuration(int duration) {
    return _$onChangeDurationAsyncAction
        .run(() => super.onChangeDuration(duration));
  }

  final _$onChangeObservationAsyncAction =
      AsyncAction('_SymptomStoreBase.onChangeObservation');

  @override
  Future<dynamic> onChangeObservation(String observation) {
    return _$onChangeObservationAsyncAction
        .run(() => super.onChangeObservation(observation));
  }

  final _$onChangeSymptomGenericIdAsyncAction =
      AsyncAction('_SymptomStoreBase.onChangeSymptomGenericId');

  @override
  Future<dynamic> onChangeSymptomGenericId(String symptomGenericId) {
    return _$onChangeSymptomGenericIdAsyncAction
        .run(() => super.onChangeSymptomGenericId(symptomGenericId));
  }

  final _$getSymptomsAsyncAction = AsyncAction('_SymptomStoreBase.getSymptoms');

  @override
  Future<ResponseDataError> getSymptoms() {
    return _$getSymptomsAsyncAction.run(() => super.getSymptoms());
  }

  final _$createSymptomAsyncAction =
      AsyncAction('_SymptomStoreBase.createSymptom');

  @override
  Future<dynamic> createSymptom() {
    return _$createSymptomAsyncAction.run(() => super.createSymptom());
  }

  @override
  String toString() {
    return '''
symptoms: ${symptoms},
happenedAt: ${happenedAt},
durationSeconds: ${durationSeconds},
observation: ${observation},
symptomGenericId: ${symptomGenericId},
fetchSymptomsFuture: ${fetchSymptomsFuture},
loading: ${loading},
error: ${error},
success: ${success}
    ''';
  }
}
