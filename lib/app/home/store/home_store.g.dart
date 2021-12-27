// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$loadingAtom = Atom(name: 'HomeStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$changeLocationAsyncAction =
      AsyncAction('HomeStoreBase.changeLocation');

  @override
  Future changeLocation(LatLng value) {
    return _$changeLocationAsyncAction.run(() => super.changeLocation(value));
  }

  final _$_addMarkerAsyncAction = AsyncAction('HomeStoreBase._addMarker');

  @override
  Future _addMarker(LatLng point) {
    return _$_addMarkerAsyncAction.run(() => super._addMarker(point));
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  dynamic takePhoto() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.takePhoto');
    try {
      return super.takePhoto();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
