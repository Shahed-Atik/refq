// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$selectedLocationAtom = Atom(name: 'HomeStoreBase.selectedLocation');

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

  final _$imageAtom = Atom(name: 'HomeStoreBase.image');

  @override
  File? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(File? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  final _$takePhotoAsyncAction = AsyncAction('HomeStoreBase.takePhoto');

  @override
  Future takePhoto() {
    return _$takePhotoAsyncAction.run(() => super.takePhoto());
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

  @override
  String toString() {
    return '''
selectedLocation: ${selectedLocation},
loading: ${loading},
image: ${image}
    ''';
  }
}
