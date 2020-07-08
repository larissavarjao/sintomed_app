import 'package:mobx/mobx.dart';
import 'package:sintomed_app/src/models/symptom_generic_model.dart';
import 'package:sintomed_app/src/repositories/symptom_generic_repository.dart';

part 'symptom_generic_store.g.dart';

class SymptomGenericStore = _SymptomGenericStoreBase with _$SymptomGenericStore;

abstract class _SymptomGenericStoreBase with Store {
  SymptomsGenericsRepository _repository = SymptomsGenericsRepository();

  @observable
  List<SymptomGeneric> symptomsGenerics;

  @observable
  ObservableFuture<List<SymptomGeneric>> fetchSymptomsGenericsFuture =
      ObservableFuture<List<SymptomGeneric>>(emptySymptomsGenericsResponse);

  static ObservableFuture<List<SymptomGeneric>> emptySymptomsGenericsResponse =
      ObservableFuture.value(null);

  @computed
  bool get loading =>
      fetchSymptomsGenericsFuture.status == FutureStatus.pending;

  @computed
  bool get error => fetchSymptomsGenericsFuture.status == FutureStatus.rejected;

  @computed
  bool get success =>
      fetchSymptomsGenericsFuture.status == FutureStatus.fulfilled;

  @action
  Future getSymptomsGenerics() async {
    final future = _repository.loadData();
    fetchSymptomsGenericsFuture = ObservableFuture(future);

    future.then((genericsList) {
      this.symptomsGenerics = genericsList;
    }).catchError((error) => print(error));
  }
}
