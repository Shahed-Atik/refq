// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accepted_injury_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AcceptedInjuryDetailsStore on AcceptedInjuryDetailsStoreBase, Store {
  final _$loadingAtom = Atom(name: 'AcceptedInjuryDetailsStoreBase.loading');

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

  final _$selectedLocationAtom =
      Atom(name: 'AcceptedInjuryDetailsStoreBase.selectedLocation');

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

  final _$decsAtom = Atom(name: 'AcceptedInjuryDetailsStoreBase.decs');

  @override
  String get decs {
    _$decsAtom.reportRead();
    return super.decs;
  }

  @override
  set decs(String value) {
    _$decsAtom.reportWrite(value, super.decs, () {
      super.decs = value;
    });
  }

  final _$changeLocationAsyncAction =
      AsyncAction('AcceptedInjuryDetailsStoreBase.changeLocation');

  @override
  Future changeLocation(LatLng value) {
    return _$changeLocationAsyncAction.run(() => super.changeLocation(value));
  }

  final _$_addMarkerAsyncAction =
      AsyncAction('AcceptedInjuryDetailsStoreBase._addMarker');

  @override
  Future _addMarker(LatLng point) {
    return _$_addMarkerAsyncAction.run(() => super._addMarker(point));
  }

  final _$AcceptedInjuryDetailsStoreBaseActionController =
      ActionController(name: 'AcceptedInjuryDetailsStoreBase');

  @override
  dynamic onInjuryChipsChanged(List<Injury> list) {
    final _$actionInfo =
        _$AcceptedInjuryDetailsStoreBaseActionController.startAction(
            name: 'AcceptedInjuryDetailsStoreBase.onInjuryChipsChanged');
    try {
      return super.onInjuryChipsChanged(list);
    } finally {
      _$AcceptedInjuryDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
selectedLocation: ${selectedLocation},
decs: ${decs}
    ''';
  }
}
