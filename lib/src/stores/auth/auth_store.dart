import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sintomed_app/src/models/user_model.dart';
import 'package:sintomed_app/src/models/user_token_model.dart';
import 'package:sintomed_app/src/repositories/user_repository.dart';
import 'package:sintomed_app/src/services/shared_pref_service.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  UserRepository _repository = UserRepository();
  SharedPrefService _prefService =
      SharedPrefService(SharedPreferences.getInstance());

  @observable
  User user;
  @observable
  String token = '';

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
  ObservableFuture<Response> registerUserFuture =
      ObservableFuture<Response>(emptyRegisterUserResponse);

  static ObservableFuture<Response> emptyRegisterUserResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<UserToken> loginUserFuture =
      ObservableFuture<UserToken>(emptyLoginUserResponse);

  static ObservableFuture<UserToken> emptyLoginUserResponse =
      ObservableFuture.value(null);

  @computed
  bool get loading => registerUserFuture.status == FutureStatus.pending;

  @computed
  bool get error => registerUserFuture.status == FutureStatus.rejected;

  @computed
  bool get success => registerUserFuture.status == FutureStatus.fulfilled;

  @computed
  bool get loginLoading => loginUserFuture.status == FutureStatus.pending;

  @computed
  bool get loginError => loginUserFuture.status == FutureStatus.rejected;

  @computed
  bool get loginSuccess =>
      loginUserFuture.status == FutureStatus.fulfilled && this.token.isNotEmpty;

  @computed
  bool get isPasswordsEquals => this.password == this.confirmPassword;

  @action
  Future onChangeFirstName(String firstName) async {
    this.firstName = firstName;
  }

  @action
  Future logoutUserOnInvalidToken() async {
    this.token = null;
    await _prefService.removeAuthToken();
  }

  @action
  Future<bool> isLoggedIn() async {
    bool isLogged = false;
    bool isLoggedOnStore = this.token != '';
    bool isLoggedOnSharedPref = await _prefService.isLoggedIn;

    if (!isLoggedOnStore && isLoggedOnSharedPref) {
      String token = await _prefService.authToken;
      this.token = token;
      isLogged = true;
    } else if (isLoggedOnStore && !isLoggedOnSharedPref) {
      await _prefService.saveAuthToken(this.token);
      isLogged = true;
    } else if (isLoggedOnStore && isLoggedOnSharedPref) {
      isLogged = true;
    }

    return isLogged;
  }

  @action
  Future setToken(String token) async {
    await _prefService.saveAuthToken(token);
    this.token = token;
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
    registerUserFuture = ObservableFuture(future);

    bool isUserRegistered;

    await future.then((newUser) {
      isUserRegistered = true;
    }).catchError((error) => isUserRegistered = false);

    return isUserRegistered;
  }

  @action
  Future<bool> logInUser() async {
    print('entrei login');
    final future = _repository.loginUser(this.email, this.password);
    loginUserFuture = ObservableFuture(loginUserFuture);

    bool isUserLogged;

    await future.then((userToken) {
      print(
        'entrei login sucesso $userToken',
      );
      this.user = User.fromJson(userToken['user']);
      this.token = userToken['token'];
      this.setToken(token);

      isUserLogged = true;
    }).catchError((error) => isUserLogged = false);

    return isUserLogged;
  }

  @action
  Future<void> logOutUser() async {
    this.user = null;
    this.token = null;
    this.firstName = null;
    this.lastName = null;
    this.pacientName = null;
    this.email = null;
    this.password = null;
    this.confirmPassword = null;

    await _prefService.removeAuthToken();
  }
}
