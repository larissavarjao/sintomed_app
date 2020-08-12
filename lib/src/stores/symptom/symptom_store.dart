import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:sintomed_app/src/models/response_data_error.dart';
import 'package:sintomed_app/src/models/symptom_model.dart';
import 'package:sintomed_app/src/repositories/symptom_repository.dart';

part 'symptom_store.g.dart';

class SymptomStore = _SymptomStoreBase with _$SymptomStore;

abstract class _SymptomStoreBase with Store {
  SymptomsRepository _repository = SymptomsRepository();

  @observable
  List<Symptom> symptoms;

  @observable
  DateTime happenedAt = DateTime.now();
  @observable
  TimeOfDay duration = TimeOfDay(hour: 0, minute: 5);
  @observable
  String observation;
  @observable
  String symptomGenericId;

  @observable
  ObservableFuture<List<Symptom>> fetchSymptomsFuture =
      ObservableFuture<List<Symptom>>(emptySymptomsResponse);

  static ObservableFuture<List<Symptom>> emptySymptomsResponse =
      ObservableFuture.value(null);

  @computed
  bool get loading => fetchSymptomsFuture.status == FutureStatus.pending;

  @computed
  bool get error => fetchSymptomsFuture.status == FutureStatus.rejected;

  @computed
  bool get success => fetchSymptomsFuture.status == FutureStatus.fulfilled;

  @action
  Future onChangeHappenedAt(DateTime happenedAt) async {
    this.happenedAt = happenedAt;
  }

  @action
  Future onChangeDuration(TimeOfDay duration) async {
    this.duration = duration;
  }

  @action
  Future onChangeObservation(String observation) async {
    this.observation = observation;
  }

  @action
  Future onChangeSymptomGenericId(String symptomGenericId) async {
    this.symptomGenericId = symptomGenericId;
  }

  @action
  Future<ResponseDataError> getSymptoms() async {
    List<Symptom> data;
    dynamic error;

    final future = _repository.loadData();
    fetchSymptomsFuture = ObservableFuture(future);

    await future.then((symptomsList) {
      this.symptoms = symptomsList;
      data = symptomsList;
    }).catchError((e) => error = e);

    return ResponseDataError(data: data, error: error);
  }

  @action
  Future createSymptom() async {}
}
