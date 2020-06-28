import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:sintomed_app/src/models/user_model.dart';
import 'package:sintomed_app/src/models/user_token_model.dart';
import 'package:sintomed_app/src/repositories/user_repository.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  UserRepository _repository = UserRepository();

  @observable
  User user;
  @observable
  String firstName;
  @observable
  String lastName;
  @observable
  String pacientName;
  @observable
  String email;
  @observable
  String password;
  @observable
  String confirmPassword;

  @observable
  ObservableFuture<Response> registerUserTypesFuture =
      ObservableFuture<Response>(emptySyntomsTypesResponse);

  static ObservableFuture<Response> emptySyntomsTypesResponse =
      ObservableFuture.value(null);

  @computed
  bool get loading => registerUserTypesFuture.status == FutureStatus.pending;

  @computed
  bool get error => registerUserTypesFuture.status == FutureStatus.rejected;

  @computed
  bool get success => registerUserTypesFuture.status == FutureStatus.fulfilled;

  @computed
  bool get isPasswordsEquals => this.password == this.confirmPassword;

  @action
  Future onChangeFirstName(String firstName) async {
    this.firstName = firstName;
  }

  @action
  Future onChangeLastName(String lastName) async {
    this.lastName = lastName;
  }

  @action
  Future onChangePacienttName(String pacientName) async {
    this.pacientName = pacientName;
  }

  @action
  Future onChangeEmail(String email) async {
    this.email = email.trim();
  }

  @action
  Future onChangePassword(String password) async {
    this.password = password.trim();
  }

  @action
  Future onChangeConfirmPassword(String confirmPassword) async {
    this.confirmPassword = confirmPassword.trim();
  }

  @action
  Future<bool> registerUser() async {
    final future = _repository.registerUser(this.email, this.password,
        this.firstName, this.lastName, this.pacientName);
    registerUserTypesFuture = ObservableFuture(future);

    bool isUserRegistered;

    await future.then((newUser) {
      isUserRegistered = true;
    }).catchError((error) => isUserRegistered = false);

    return isUserRegistered;
  }
}
