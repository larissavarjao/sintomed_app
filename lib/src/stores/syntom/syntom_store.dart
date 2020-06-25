import 'package:mobx/mobx.dart';
import 'package:sintomed_app/src/models/syntom_model.dart';
import 'package:sintomed_app/src/repositories/syntom_repository.dart';

part 'syntom_store.g.dart';

class SyntomStore = _SyntomStoreBase with _$SyntomStore;

abstract class _SyntomStoreBase with Store {
  SyntomsRepository _repository = SyntomsRepository();

  @observable
  List<Syntom> syntoms;

  @observable
  ObservableFuture<List<Syntom>> fetchSyntomsFuture =
      ObservableFuture<List<Syntom>>(emptySyntomsResponse);

  static ObservableFuture<List<Syntom>> emptySyntomsResponse =
      ObservableFuture.value(null);

  @computed
  bool get loading => fetchSyntomsFuture.status == FutureStatus.pending;

  @computed
  bool get error => fetchSyntomsFuture.status == FutureStatus.rejected;

  @computed
  bool get success => fetchSyntomsFuture.status == FutureStatus.fulfilled;

  @action
  Future getSyntoms() async {
    final future = _repository.loadData();
    fetchSyntomsFuture = ObservableFuture(future);

    future.then((syntomsList) {
      this.syntoms = syntomsList;
    }).catchError((error) => print(error));
  }
}
