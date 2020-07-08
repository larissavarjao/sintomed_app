import 'package:mobx/mobx.dart';
import 'package:sintomed_app/src/models/symptom_type_model.dart';
import 'package:sintomed_app/src/repositories/symptom_type_repository.dart';

part 'symptom_type_store.g.dart';

class SymptomTypeStore = _SymptomTypeStoreBase with _$SymptomTypeStore;

abstract class _SymptomTypeStoreBase with Store {
  SymptomsTypesRepository _repository = SymptomsTypesRepository();

  @observable
  List<SymptomType> symptomsTypes;

  @observable
  ObservableFuture<List<SymptomType>> fetchSymptomsTypesFuture =
      ObservableFuture<List<SymptomType>>(emptySymptomsTypesResponse);

  static ObservableFuture<List<SymptomType>> emptySymptomsTypesResponse =
      ObservableFuture.value(null);

  @computed
  bool get loading => fetchSymptomsTypesFuture.status == FutureStatus.pending;

  @computed
  bool get error => fetchSymptomsTypesFuture.status == FutureStatus.rejected;

  @computed
  bool get success => fetchSymptomsTypesFuture.status == FutureStatus.fulfilled;

  @action
  Future getSymptomsTypes() async {
    final future = _repository.loadData();
    fetchSymptomsTypesFuture = ObservableFuture(future);

    future.then((typesList) {
      this.symptomsTypes = typesList;
    }).catchError((error) => print(error));
  }
}
