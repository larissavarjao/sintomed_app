import 'package:mobx/mobx.dart';
import 'package:sintomed_app/src/models/syntom_generic_model.dart';
import 'package:sintomed_app/src/repositories/syntom_generic_repository.dart';

part 'syntom_generic_store.g.dart';

class SyntomGenericStore = _SyntomGenericStoreBase with _$SyntomGenericStore;

abstract class _SyntomGenericStoreBase with Store {
  SyntomsGenericsRepository _repository = SyntomsGenericsRepository();

  @observable
  List<SyntomGeneric> syntomsGenerics;

  @observable
  ObservableFuture<List<SyntomGeneric>> fetchSyntomsGenericsFuture =
      ObservableFuture<List<SyntomGeneric>>(emptySyntomsGenericsResponse);

  static ObservableFuture<List<SyntomGeneric>> emptySyntomsGenericsResponse =
      ObservableFuture.value(null);

  @computed
  bool get loading => fetchSyntomsGenericsFuture.status == FutureStatus.pending;

  @computed
  bool get error => fetchSyntomsGenericsFuture.status == FutureStatus.rejected;

  @computed
  bool get success =>
      fetchSyntomsGenericsFuture.status == FutureStatus.fulfilled;

  @action
  Future getSyntomsGenerics() async {
    final future = _repository.loadData();
    fetchSyntomsGenericsFuture = ObservableFuture(future);

    future.then((genericsList) {
      this.syntomsGenerics = genericsList;
    }).catchError((error) => print(error));
  }
}
