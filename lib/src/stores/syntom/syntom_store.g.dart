// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syntom_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SyntomStore on _SyntomStoreBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_SyntomStoreBase.loading'))
      .value;
  Computed<bool> _$errorComputed;

  @override
  bool get error => (_$errorComputed ??=
          Computed<bool>(() => super.error, name: '_SyntomStoreBase.error'))
      .value;
  Computed<bool> _$successComputed;

  @override
  bool get success => (_$successComputed ??=
          Computed<bool>(() => super.success, name: '_SyntomStoreBase.success'))
      .value;

  final _$syntomsAtom = Atom(name: '_SyntomStoreBase.syntoms');

  @override
  List<Syntom> get syntoms {
    _$syntomsAtom.reportRead();
    return super.syntoms;
  }

  @override
  set syntoms(List<Syntom> value) {
    _$syntomsAtom.reportWrite(value, super.syntoms, () {
      super.syntoms = value;
    });
  }

  final _$fetchSyntomsFutureAtom =
      Atom(name: '_SyntomStoreBase.fetchSyntomsFuture');

  @override
  ObservableFuture<List<Syntom>> get fetchSyntomsFuture {
    _$fetchSyntomsFutureAtom.reportRead();
    return super.fetchSyntomsFuture;
  }

  @override
  set fetchSyntomsFuture(ObservableFuture<List<Syntom>> value) {
    _$fetchSyntomsFutureAtom.reportWrite(value, super.fetchSyntomsFuture, () {
      super.fetchSyntomsFuture = value;
    });
  }

  final _$getSyntomsAsyncAction = AsyncAction('_SyntomStoreBase.getSyntoms');

  @override
  Future<dynamic> getSyntoms() {
    return _$getSyntomsAsyncAction.run(() => super.getSyntoms());
  }

  @override
  String toString() {
    return '''
syntoms: ${syntoms},
fetchSyntomsFuture: ${fetchSyntomsFuture},
loading: ${loading},
error: ${error},
success: ${success}
    ''';
  }
}
