import 'package:mobx/mobx.dart';
import 'package:sintomed_app/src/models/syntom_type_model.dart';
import 'package:sintomed_app/src/repositories/syntom_type_repository.dart';

part 'syntom_type_store.g.dart';

class SyntomTypeStore = _SyntomTypeStoreBase with _$SyntomTypeStore;

abstract class _SyntomTypeStoreBase with Store {
  SyntomsTypesRepository _repository = SyntomsTypesRepository();

  @observable
  List<SyntomType> syntomsTypes;

  @observable
  ObservableFuture<List<SyntomType>> fetchSyntomsTypesFuture =
      ObservableFuture<List<SyntomType>>(emptySyntomsTypesResponse);

  static ObservableFuture<List<SyntomType>> emptySyntomsTypesResponse =
      ObservableFuture.value(null);

  @computed
  bool get loading => fetchSyntomsTypesFuture.status == FutureStatus.pending;

  @computed
  bool get error => fetchSyntomsTypesFuture.status == FutureStatus.rejected;

  @computed
  bool get success => fetchSyntomsTypesFuture.status == FutureStatus.fulfilled;

  @action
  Future getSyntomsTypes() async {
    final future = _repository.loadData();
    fetchSyntomsTypesFuture = ObservableFuture(future);

    future.then((typesList) {
      this.syntomsTypes = typesList;
    }).catchError((error) => print(error));
  }
}
