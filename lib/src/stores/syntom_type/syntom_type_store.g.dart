// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syntom_type_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SyntomTypeStore on _SyntomTypeStoreBase, Store {
  Computed<bool> _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_SyntomTypeStoreBase.loading'))
      .value;
  Computed<bool> _$errorComputed;

  @override
  bool get error => (_$errorComputed ??=
          Computed<bool>(() => super.error, name: '_SyntomTypeStoreBase.error'))
      .value;
  Computed<bool> _$successComputed;

  @override
  bool get success => (_$successComputed ??= Computed<bool>(() => super.success,
          name: '_SyntomTypeStoreBase.success'))
      .value;

  final _$syntomsTypesAtom = Atom(name: '_SyntomTypeStoreBase.syntomsTypes');

  @override
  List<SyntomType> get syntomsTypes {
    _$syntomsTypesAtom.reportRead();
    return super.syntomsTypes;
  }

  @override
  set syntomsTypes(List<SyntomType> value) {
    _$syntomsTypesAtom.reportWrite(value, super.syntomsTypes, () {
      super.syntomsTypes = value;
    });
  }

  final _$fetchSyntomsTypesFutureAtom =
      Atom(name: '_SyntomTypeStoreBase.fetchSyntomsTypesFuture');

  @override
  ObservableFuture<List<SyntomType>> get fetchSyntomsTypesFuture {
    _$fetchSyntomsTypesFutureAtom.reportRead();
    return super.fetchSyntomsTypesFuture;
  }

  @override
  set fetchSyntomsTypesFuture(ObservableFuture<List<SyntomType>> value) {
    _$fetchSyntomsTypesFutureAtom
        .reportWrite(value, super.fetchSyntomsTypesFuture, () {
      super.fetchSyntomsTypesFuture = value;
    });
  }

  final _$getSyntomsTypesAsyncAction =
      AsyncAction('_SyntomTypeStoreBase.getSyntomsTypes');

  @override
  Future<dynamic> getSyntomsTypes() {
    return _$getSyntomsTypesAsyncAction.run(() => super.getSyntomsTypes());
  }

  @override
  String toString() {
    return '''
syntomsTypes: ${syntomsTypes},
fetchSyntomsTypesFuture: ${fetchSyntomsTypesFuture},
loading: ${loading},
error: ${error},
success: ${success}
    ''';
  }
}
