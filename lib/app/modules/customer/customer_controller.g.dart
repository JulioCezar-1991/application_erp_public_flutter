// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomerController on CustomerControllerBase, Store {
  late final _$customersAtom =
      Atom(name: 'CustomerControllerBase.customers', context: context);

  @override
  ObservableFuture<List<CustomerListModel>> get customers {
    _$customersAtom.reportRead();
    return super.customers;
  }

  @override
  set customers(ObservableFuture<List<CustomerListModel>> value) {
    _$customersAtom.reportWrite(value, super.customers, () {
      super.customers = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'CustomerControllerBase.name', context: context);

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

  late final _$emailAtom =
      Atom(name: 'CustomerControllerBase.email', context: context);

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
      Atom(name: 'CustomerControllerBase.telcel', context: context);

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
      Atom(name: 'CustomerControllerBase.telfix', context: context);

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

  late final _$rolesAtom =
      Atom(name: 'CustomerControllerBase.roles', context: context);

  @override
  String get roles {
    _$rolesAtom.reportRead();
    return super.roles;
  }

  @override
  set roles(String value) {
    _$rolesAtom.reportWrite(value, super.roles, () {
      super.roles = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'CustomerControllerBase.password', context: context);

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

  late final _$dataClientModelAtom =
      Atom(name: 'CustomerControllerBase.dataClientModel', context: context);

  @override
  CustomerCreaterModel get dataClientModel {
    _$dataClientModelAtom.reportRead();
    return super.dataClientModel;
  }

  @override
  set dataClientModel(CustomerCreaterModel value) {
    _$dataClientModelAtom.reportWrite(value, super.dataClientModel, () {
      super.dataClientModel = value;
    });
  }

  late final _$CustomerControllerBaseActionController =
      ActionController(name: 'CustomerControllerBase', context: context);

  @override
  dynamic fetchCustomer() {
    final _$actionInfo = _$CustomerControllerBaseActionController.startAction(
        name: 'CustomerControllerBase.fetchCustomer');
    try {
      return super.fetchCustomer();
    } finally {
      _$CustomerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateName(String value) {
    final _$actionInfo = _$CustomerControllerBaseActionController.startAction(
        name: 'CustomerControllerBase.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$CustomerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$CustomerControllerBaseActionController.startAction(
        name: 'CustomerControllerBase.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$CustomerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateTelCel(String value) {
    final _$actionInfo = _$CustomerControllerBaseActionController.startAction(
        name: 'CustomerControllerBase.validateTelCel');
    try {
      return super.validateTelCel(value);
    } finally {
      _$CustomerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateTelFix(String value) {
    final _$actionInfo = _$CustomerControllerBaseActionController.startAction(
        name: 'CustomerControllerBase.validateTelFix');
    try {
      return super.validateTelFix(value);
    } finally {
      _$CustomerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateRoles(String value) {
    final _$actionInfo = _$CustomerControllerBaseActionController.startAction(
        name: 'CustomerControllerBase.validateRoles');
    try {
      return super.validateRoles(value);
    } finally {
      _$CustomerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$CustomerControllerBaseActionController.startAction(
        name: 'CustomerControllerBase.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$CustomerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customers: ${customers},
name: ${name},
email: ${email},
telcel: ${telcel},
telfix: ${telfix},
roles: ${roles},
password: ${password},
dataClientModel: ${dataClientModel}
    ''';
  }
}

mixin _$FormCustomerErrorState on _FormcustomerErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormcustomerErrorState.hasErrors'))
          .value;

  late final _$nameAtom =
      Atom(name: '_FormcustomerErrorState.name', context: context);

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

  late final _$telcelAtom =
      Atom(name: '_FormcustomerErrorState.telcel', context: context);

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
      Atom(name: '_FormcustomerErrorState.telfix', context: context);

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
      Atom(name: '_FormcustomerErrorState.email', context: context);

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

  late final _$passwordAtom =
      Atom(name: '_FormcustomerErrorState.password', context: context);

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

  late final _$rolesAtom =
      Atom(name: '_FormcustomerErrorState.roles', context: context);

  @override
  String get roles {
    _$rolesAtom.reportRead();
    return super.roles;
  }

  @override
  set roles(String value) {
    _$rolesAtom.reportWrite(value, super.roles, () {
      super.roles = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
telcel: ${telcel},
telfix: ${telfix},
email: ${email},
password: ${password},
roles: ${roles},
hasErrors: ${hasErrors}
    ''';
  }
}
