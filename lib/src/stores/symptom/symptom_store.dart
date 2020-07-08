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
  Future getSymptoms() async {
    final future = _repository.loadData();
    fetchSymptomsFuture = ObservableFuture(future);

    future.then((symptomsList) {
      this.symptoms = symptomsList;
    }).catchError((error) => print(error));
  }
}
