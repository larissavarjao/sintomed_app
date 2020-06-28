// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStoreBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_UserStoreBase.loading'))
      .value;
  Computed<bool> _$errorComputed;

  @override
  bool get error => (_$errorComputed ??=
          Computed<bool>(() => super.error, name: '_UserStoreBase.error'))
      .value;
  Computed<bool> _$successComputed;

  @override
  bool get success => (_$successComputed ??=
          Computed<bool>(() => super.success, name: '_UserStoreBase.success'))
      .value;
  Computed<bool> _$isPasswordsEqualsComputed;

  @override
  bool get isPasswordsEquals => (_$isPasswordsEqualsComputed ??= Computed<bool>(
          () => super.isPasswordsEquals,
          name: '_UserStoreBase.isPasswordsEquals'))
      .value;

  final _$userAtom = Atom(name: '_UserStoreBase.user');

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

  final _$firstNameAtom = Atom(name: '_UserStoreBase.firstName');

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

  final _$lastNameAtom = Atom(name: '_UserStoreBase.lastName');

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

  final _$pacientNameAtom = Atom(name: '_UserStoreBase.pacientName');

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

  final _$emailAtom = Atom(name: '_UserStoreBase.email');

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

  final _$passwordAtom = Atom(name: '_UserStoreBase.password');

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

  final _$confirmPasswordAtom = Atom(name: '_UserStoreBase.confirmPassword');

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

  final _$registerUserTypesFutureAtom =
      Atom(name: '_UserStoreBase.registerUserTypesFuture');

  @override
  ObservableFuture<Response<dynamic>> get registerUserTypesFuture {
    _$registerUserTypesFutureAtom.reportRead();
    return super.registerUserTypesFuture;
  }

  @override
  set registerUserTypesFuture(ObservableFuture<Response<dynamic>> value) {
    _$registerUserTypesFutureAtom
        .reportWrite(value, super.registerUserTypesFuture, () {
      super.registerUserTypesFuture = value;
    });
  }

  final _$onChangeFirstNameAsyncAction =
      AsyncAction('_UserStoreBase.onChangeFirstName');

  @override
  Future<dynamic> onChangeFirstName(String firstName) {
    return _$onChangeFirstNameAsyncAction
        .run(() => super.onChangeFirstName(firstName));
  }

  final _$onChangeLastNameAsyncAction =
      AsyncAction('_UserStoreBase.onChangeLastName');

  @override
  Future<dynamic> onChangeLastName(String lastName) {
    return _$onChangeLastNameAsyncAction
        .run(() => super.onChangeLastName(lastName));
  }

  final _$onChangePacienttNameAsyncAction =
      AsyncAction('_UserStoreBase.onChangePacienttName');

  @override
  Future<dynamic> onChangePacienttName(String pacientName) {
    return _$onChangePacienttNameAsyncAction
        .run(() => super.onChangePacienttName(pacientName));
  }

  final _$onChangeEmailAsyncAction =
      AsyncAction('_UserStoreBase.onChangeEmail');

  @override
  Future<dynamic> onChangeEmail(String email) {
    return _$onChangeEmailAsyncAction.run(() => super.onChangeEmail(email));
  }

  final _$onChangePasswordAsyncAction =
      AsyncAction('_UserStoreBase.onChangePassword');

  @override
  Future<dynamic> onChangePassword(String password) {
    return _$onChangePasswordAsyncAction
        .run(() => super.onChangePassword(password));
  }

  final _$onChangeConfirmPasswordAsyncAction =
      AsyncAction('_UserStoreBase.onChangeConfirmPassword');

  @override
  Future<dynamic> onChangeConfirmPassword(String confirmPassword) {
    return _$onChangeConfirmPasswordAsyncAction
        .run(() => super.onChangeConfirmPassword(confirmPassword));
  }

  final _$registerUserAsyncAction = AsyncAction('_UserStoreBase.registerUser');

  @override
  Future<bool> registerUser() {
    return _$registerUserAsyncAction.run(() => super.registerUser());
  }

  @override
  String toString() {
    return '''
user: ${user},
firstName: ${firstName},
lastName: ${lastName},
pacientName: ${pacientName},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
registerUserTypesFuture: ${registerUserTypesFuture},
loading: ${loading},
error: ${error},
success: ${success},
isPasswordsEquals: ${isPasswordsEquals}
    ''';
  }
}
