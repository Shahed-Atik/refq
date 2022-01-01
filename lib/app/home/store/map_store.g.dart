// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MapStore on MapStoreBase, Store {
  Computed<bool>? _$isChoosedLocationComputed;

  @override
  bool get isChoosedLocation => (_$isChoosedLocationComputed ??= Computed<bool>(
          () => super.isChoosedLocation,
          name: 'MapStoreBase.isChoosedLocation'))
      .value;

  final _$selectedLocationAtom = Atom(name: 'MapStoreBase.selectedLocation');

  @override
  LatLng? get selectedLocation {
    _$selectedLocationAtom.reportRead();
    return super.selectedLocation;
  }

  @override
  set selectedLocation(LatLng? value) {
    _$selectedLocationAtom.reportWrite(value, super.selectedLocation, () {
      super.selectedLocation = value;
    });
  }

  final _$changeLocationAsyncAction =
      AsyncAction('MapStoreBase.changeLocation');

  @override
  Future changeLocation(LatLng value) {
    return _$changeLocationAsyncAction.run(() => super.changeLocation(value));
  }

  final _$_addMarkerAsyncAction = AsyncAction('MapStoreBase._addMarker');

  @override
  Future _addMarker(LatLng point) {
    return _$_addMarkerAsyncAction.run(() => super._addMarker(point));
  }

  @override
  String toString() {
    return '''
selectedLocation: ${selectedLocation},
isChoosedLocation: ${isChoosedLocation}
    ''';
  }
}
