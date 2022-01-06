// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injury_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InjuryDetailsStore on InjuryDetailsStoreBase, Store {
  final _$imageAtom = Atom(name: 'InjuryDetailsStoreBase.image');

  @override
  String get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$changeLocationAsyncAction =
      AsyncAction('InjuryDetailsStoreBase.changeLocation');

  @override
  Future changeLocation(LatLng value) {
    return _$changeLocationAsyncAction.run(() => super.changeLocation(value));
  }

  final _$_addMarkerAsyncAction =
      AsyncAction('InjuryDetailsStoreBase._addMarker');

  @override
  Future _addMarker(LatLng point) {
    return _$_addMarkerAsyncAction.run(() => super._addMarker(point));
  }

  @override
  String toString() {
    return '''
image: ${image}
    ''';
  }
}
