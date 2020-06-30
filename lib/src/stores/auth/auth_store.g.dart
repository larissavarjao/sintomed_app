// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_AuthStoreBase.loading'))
      .value;
  Computed<bool> _$errorComputed;

  @override
  bool get error => (_$errorComputed ??=
          Computed<bool>(() => super.error, name: '_AuthStoreBase.error'))
      .value;
  Computed<bool> _$successComputed;

  @override
  bool get success => (_$successComputed ??=
          Computed<bool>(() => super.success, name: '_AuthStoreBase.success'))
      .value;
  Computed<bool> _$isPasswordsEqualsComputed;

  @override
  bool get isPasswordsEquals => (_$isPasswordsEqualsComputed ??= Computed<bool>(
          () => super.isPasswordsEquals,
          name: '_AuthStoreBase.isPasswordsEquals'))
      .value;

  final _$userAtom = Atom(name: '_AuthStoreBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$tokenAtom = Atom(name: '_AuthStoreBase.token');

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$firstNameAtom = Atom(name: '_AuthStoreBase.firstName');

  @override
  String get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  final _$lastNameAtom = Atom(name: '_AuthStoreBase.lastName');

  @override
  String get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  final _$pacientNameAtom = Atom(name: '_AuthStoreBase.pacientName');

  @override
  String get pacientName {
    _$pacientNameAtom.reportRead();
    return super.pacientName;
  }

  @override
  set pacientName(String value) {
    _$pacientNameAtom.reportWrite(value, super.pacientName, () {
      super.pacientName = value;
    });
  }

  final _$emailAtom = Atom(name: '_AuthStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_AuthStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom = Atom(name: '_AuthStoreBase.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$registerUserFutureAtom =
      Atom(name: '_AuthStoreBase.registerUserFuture');

  @override
  ObservableFuture<Response<dynamic>> get registerUserFuture {
    _$registerUserFutureAtom.reportRead();
    return super.registerUserFuture;
  }

  @override
  set registerUserFuture(ObservableFuture<Response<dynamic>> value) {
    _$registerUserFutureAtom.reportWrite(value, super.registerUserFuture, () {
      super.registerUserFuture = value;
    });
  }

  final _$loginUserFutureAtom = Atom(name: '_AuthStoreBase.loginUserFuture');

  @override
  ObservableFuture<UserToken> get loginUserFuture {
    _$loginUserFutureAtom.reportRead();
    return super.loginUserFuture;
  }

  @override
  set loginUserFuture(ObservableFuture<UserToken> value) {
    _$loginUserFutureAtom.reportWrite(value, super.loginUserFuture, () {
      super.loginUserFuture = value;
    });
  }

  final _$onChangeFirstNameAsyncAction =
      AsyncAction('_AuthStoreBase.onChangeFirstName');

  @override
  Future<dynamic> onChangeFirstName(String firstName) {
    return _$onChangeFirstNameAsyncAction
        .run(() => super.onChangeFirstName(firstName));
  }

  final _$isLoggedInAsyncAction = AsyncAction('_AuthStoreBase.isLoggedIn');

  @override
  Future<bool> isLoggedIn() {
    return _$isLoggedInAsyncAction.run(() => super.isLoggedIn());
  }

  final _$setTokenAsyncAction = AsyncAction('_AuthStoreBase.setToken');

  @override
  Future<dynamic> setToken(String token) {
    return _$setTokenAsyncAction.run(() => super.setToken(token));
  }

  final _$onChangeLastNameAsyncAction =
      AsyncAction('_AuthStoreBase.onChangeLastName');

  @override
  Future<dynamic> onChangeLastName(String lastName) {
    return _$onChangeLastNameAsyncAction
        .run(() => super.onChangeLastName(lastName));
  }

  final _$onChangePacienttNameAsyncAction =
      AsyncAction('_AuthStoreBase.onChangePacienttName');

  @override
  Future<dynamic> onChangePacienttName(String pacientName) {
    return _$onChangePacienttNameAsyncAction
        .run(() => super.onChangePacienttName(pacientName));
  }

  final _$onChangeEmailAsyncAction =
      AsyncAction('_AuthStoreBase.onChangeEmail');

  @override
  Future<dynamic> onChangeEmail(String email) {
    return _$onChangeEmailAsyncAction.run(() => super.onChangeEmail(email));
  }

  final _$onChangePasswordAsyncAction =
      AsyncAction('_AuthStoreBase.onChangePassword');

  @override
  Future<dynamic> onChangePassword(String password) {
    return _$onChangePasswordAsyncAction
        .run(() => super.onChangePassword(password));
  }

  final _$onChangeConfirmPasswordAsyncAction =
      AsyncAction('_AuthStoreBase.onChangeConfirmPassword');

  @override
  Future<dynamic> onChangeConfirmPassword(String confirmPassword) {
    return _$onChangeConfirmPasswordAsyncAction
        .run(() => super.onChangeConfirmPassword(confirmPassword));
  }

  final _$registerUserAsyncAction = AsyncAction('_AuthStoreBase.registerUser');

  @override
  Future<bool> registerUser() {
    return _$registerUserAsyncAction.run(() => super.registerUser());
  }

  final _$logInUserAsyncAction = AsyncAction('_AuthStoreBase.logInUser');

  @override
  Future<bool> logInUser() {
    return _$logInUserAsyncAction.run(() => super.logInUser());
  }

  final _$logOutUserAsyncAction = AsyncAction('_AuthStoreBase.logOutUser');

  @override
  Future<void> logOutUser() {
    return _$logOutUserAsyncAction.run(() => super.logOutUser());
  }

  @override
  String toString() {
    return '''
user: ${user},
token: ${token},
firstName: ${firstName},
lastName: ${lastName},
pacientName: ${pacientName},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
registerUserFuture: ${registerUserFuture},
loginUserFuture: ${loginUserFuture},
loading: ${loading},
error: ${error},
success: ${success},
isPasswordsEquals: ${isPasswordsEquals}
    ''';
  }
}
