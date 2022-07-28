// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ClientController on ClientControllerBase, Store {
  late final _$clientsAtom =
      Atom(name: 'ClientControllerBase.clients', context: context);

  @override
  ObservableFuture<List<ClientListModel>> get clients {
    _$clientsAtom.reportRead();
    return super.clients;
  }

  @override
  set clients(ObservableFuture<List<ClientListModel>> value) {
    _$clientsAtom.reportWrite(value, super.clients, () {
      super.clients = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'ClientControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$cpfAtom =
      Atom(name: 'ClientControllerBase.cpf', context: context);

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'ClientControllerBase.email', context: context);

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

  late final _$telcelAtom =
      Atom(name: 'ClientControllerBase.telcel', context: context);

  @override
  String get telcel {
    _$telcelAtom.reportRead();
    return super.telcel;
  }

  @override
  set telcel(String value) {
    _$telcelAtom.reportWrite(value, super.telcel, () {
      super.telcel = value;
    });
  }

  late final _$telfixAtom =
      Atom(name: 'ClientControllerBase.telfix', context: context);

  @override
  String get telfix {
    _$telfixAtom.reportRead();
    return super.telfix;
  }

  @override
  set telfix(String value) {
    _$telfixAtom.reportWrite(value, super.telfix, () {
      super.telfix = value;
    });
  }

  late final _$addressAtom =
      Atom(name: 'ClientControllerBase.address', context: context);

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$sectorAtom =
      Atom(name: 'ClientControllerBase.sector', context: context);

  @override
  String get sector {
    _$sectorAtom.reportRead();
    return super.sector;
  }

  @override
  set sector(String value) {
    _$sectorAtom.reportWrite(value, super.sector, () {
      super.sector = value;
    });
  }

  late final _$cityAtom =
      Atom(name: 'ClientControllerBase.city', context: context);

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$stateAtom =
      Atom(name: 'ClientControllerBase.state', context: context);

  @override
  String get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(String value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$dataClientModelAtom =
      Atom(name: 'ClientControllerBase.dataClientModel', context: context);

  @override
  ClientCreateModel get dataClientModel {
    _$dataClientModelAtom.reportRead();
    return super.dataClientModel;
  }

  @override
  set dataClientModel(ClientCreateModel value) {
    _$dataClientModelAtom.reportWrite(value, super.dataClientModel, () {
      super.dataClientModel = value;
    });
  }

  late final _$ClientControllerBaseActionController =
      ActionController(name: 'ClientControllerBase', context: context);

  @override
  dynamic fetchClient() {
    final _$actionInfo = _$ClientControllerBaseActionController.startAction(
        name: 'ClientControllerBase.fetchClient');
    try {
      return super.fetchClient();
    } finally {
      _$ClientControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateName(String value) {
    final _$actionInfo = _$ClientControllerBaseActionController.startAction(
        name: 'ClientControllerBase.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$ClientControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCPF(String value) {
    final _$actionInfo = _$ClientControllerBaseActionController.startAction(
        name: 'ClientControllerBase.validateCPF');
    try {
      return super.validateCPF(value);
    } finally {
      _$ClientControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$ClientControllerBaseActionController.startAction(
        name: 'ClientControllerBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$ClientControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateTelCel(String value) {
    final _$actionInfo = _$ClientControllerBaseActionController.startAction(
        name: 'ClientControllerBase.validateTelCel');
    try {
      return super.validateTelCel(value);
    } finally {
      _$ClientControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateTelFix(String value) {
    final _$actionInfo = _$ClientControllerBaseActionController.startAction(
        name: 'ClientControllerBase.validateTelFix');
    try {
      return super.validateTelFix(value);
    } finally {
      _$ClientControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAddress(String value) {
    final _$actionInfo = _$ClientControllerBaseActionController.startAction(
        name: 'ClientControllerBase.validateAddress');
    try {
      return super.validateAddress(value);
    } finally {
      _$ClientControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateSector(String value) {
    final _$actionInfo = _$ClientControllerBaseActionController.startAction(
        name: 'ClientControllerBase.validateSector');
    try {
      return super.validateSector(value);
    } finally {
      _$ClientControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCity(String value) {
    final _$actionInfo = _$ClientControllerBaseActionController.startAction(
        name: 'ClientControllerBase.validateCity');
    try {
      return super.validateCity(value);
    } finally {
      _$ClientControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateState(String value) {
    final _$actionInfo = _$ClientControllerBaseActionController.startAction(
        name: 'ClientControllerBase.validateState');
    try {
      return super.validateState(value);
    } finally {
      _$ClientControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clients: ${clients},
name: ${name},
cpf: ${cpf},
email: ${email},
telcel: ${telcel},
telfix: ${telfix},
address: ${address},
sector: ${sector},
city: ${city},
state: ${state},
dataClientModel: ${dataClientModel}
    ''';
  }
}

mixin _$FormClientErrorState on FormClientError, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: 'FormClientError.hasErrors'))
          .value;

  late final _$nameAtom = Atom(name: 'FormClientError.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$cpfAtom = Atom(name: 'FormClientError.cpf', context: context);

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$telcelAtom =
      Atom(name: 'FormClientError.telcel', context: context);

  @override
  String get telcel {
    _$telcelAtom.reportRead();
    return super.telcel;
  }

  @override
  set telcel(String value) {
    _$telcelAtom.reportWrite(value, super.telcel, () {
      super.telcel = value;
    });
  }

  late final _$telfixAtom =
      Atom(name: 'FormClientError.telfix', context: context);

  @override
  String get telfix {
    _$telfixAtom.reportRead();
    return super.telfix;
  }

  @override
  set telfix(String value) {
    _$telfixAtom.reportWrite(value, super.telfix, () {
      super.telfix = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'FormClientError.email', context: context);

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

  late final _$addressAtom =
      Atom(name: 'FormClientError.address', context: context);

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$sectorAtom =
      Atom(name: 'FormClientError.sector', context: context);

  @override
  String get sector {
    _$sectorAtom.reportRead();
    return super.sector;
  }

  @override
  set sector(String value) {
    _$sectorAtom.reportWrite(value, super.sector, () {
      super.sector = value;
    });
  }

  late final _$cityAtom = Atom(name: 'FormClientError.city', context: context);

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$stateAtom =
      Atom(name: 'FormClientError.state', context: context);

  @override
  String get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(String value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
cpf: ${cpf},
telcel: ${telcel},
telfix: ${telfix},
email: ${email},
address: ${address},
sector: ${sector},
city: ${city},
state: ${state},
hasErrors: ${hasErrors}
    ''';
  }
}
