import 'package:mobx/mobx.dart';
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
  int durationSeconds;
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
  Future onChangeDuration(int duration) async {
    this.durationSeconds = duration;
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
  Future getSymptoms() async {
    final future = _repository.loadData();
    fetchSymptomsFuture = ObservableFuture(future);

    await future.then((symptomsList) {
      this.symptoms = symptomsList;
    }).catchError((error) => print(error));
  }

  @action
  Future createSymptom() async {}
}
