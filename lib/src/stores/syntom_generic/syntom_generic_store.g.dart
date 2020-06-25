// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syntom_generic_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SyntomGenericStore on _SyntomGenericStoreBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_SyntomGenericStoreBase.loading'))
      .value;
  Computed<bool> _$errorComputed;

  @override
  bool get error => (_$errorComputed ??= Computed<bool>(() => super.error,
          name: '_SyntomGenericStoreBase.error'))
      .value;
  Computed<bool> _$successComputed;

  @override
  bool get success => (_$successComputed ??= Computed<bool>(() => super.success,
          name: '_SyntomGenericStoreBase.success'))
      .value;

  final _$syntomsGenericsAtom =
      Atom(name: '_SyntomGenericStoreBase.syntomsGenerics');

  @override
  List<SyntomGeneric> get syntomsGenerics {
    _$syntomsGenericsAtom.reportRead();
    return super.syntomsGenerics;
  }

  @override
  set syntomsGenerics(List<SyntomGeneric> value) {
    _$syntomsGenericsAtom.reportWrite(value, super.syntomsGenerics, () {
      super.syntomsGenerics = value;
    });
  }

  final _$fetchSyntomsGenericsFutureAtom =
      Atom(name: '_SyntomGenericStoreBase.fetchSyntomsGenericsFuture');

  @override
  ObservableFuture<List<SyntomGeneric>> get fetchSyntomsGenericsFuture {
    _$fetchSyntomsGenericsFutureAtom.reportRead();
    return super.fetchSyntomsGenericsFuture;
  }

  @override
  set fetchSyntomsGenericsFuture(ObservableFuture<List<SyntomGeneric>> value) {
    _$fetchSyntomsGenericsFutureAtom
        .reportWrite(value, super.fetchSyntomsGenericsFuture, () {
      super.fetchSyntomsGenericsFuture = value;
    });
  }

  final _$getSyntomsTypesAsyncAction =
      AsyncAction('_SyntomGenericStoreBase.getSyntomsTypes');

  @override
  Future<dynamic> getSyntomsTypes() {
    return _$getSyntomsTypesAsyncAction.run(() => super.getSyntomsTypes());
  }

  @override
  String toString() {
    return '''
syntomsGenerics: ${syntomsGenerics},
fetchSyntomsGenericsFuture: ${fetchSyntomsGenericsFuture},
loading: ${loading},
error: ${error},
success: ${success}
    ''';
  }
}
