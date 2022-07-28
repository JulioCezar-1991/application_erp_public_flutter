// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderController on OrderControllerBase, Store {
  late final _$ordersOpenAtom =
      Atom(name: 'OrderControllerBase.ordersOpen', context: context);

  @override
  ObservableFuture<List<OrderOpenListModel>> get ordersOpen {
    _$ordersOpenAtom.reportRead();
    return super.ordersOpen;
  }

  @override
  set ordersOpen(ObservableFuture<List<OrderOpenListModel>> value) {
    _$ordersOpenAtom.reportWrite(value, super.ordersOpen, () {
      super.ordersOpen = value;
    });
  }

  late final _$ordersDoneAtom =
      Atom(name: 'OrderControllerBase.ordersDone', context: context);

  @override
  ObservableFuture<List<OrderDoneListModel>> get ordersDone {
    _$ordersDoneAtom.reportRead();
    return super.ordersDone;
  }

  @override
  set ordersDone(ObservableFuture<List<OrderDoneListModel>> value) {
    _$ordersDoneAtom.reportWrite(value, super.ordersDone, () {
      super.ordersDone = value;
    });
  }

  late final _$ordersCanceledAtom =
      Atom(name: 'OrderControllerBase.ordersCanceled', context: context);

  @override
  ObservableFuture<List<OrderCanceledListModel>> get ordersCanceled {
    _$ordersCanceledAtom.reportRead();
    return super.ordersCanceled;
  }

  @override
  set ordersCanceled(ObservableFuture<List<OrderCanceledListModel>> value) {
    _$ordersCanceledAtom.reportWrite(value, super.ordersCanceled, () {
      super.ordersCanceled = value;
    });
  }

  late final _$searchTextNameCustomerAtom = Atom(
      name: 'OrderControllerBase.searchTextNameCustomer', context: context);

  @override
  AutoCompleteTextField<dynamic> get searchTextNameCustomer {
    _$searchTextNameCustomerAtom.reportRead();
    return super.searchTextNameCustomer;
  }

  @override
  set searchTextNameCustomer(AutoCompleteTextField<dynamic> value) {
    _$searchTextNameCustomerAtom
        .reportWrite(value, super.searchTextNameCustomer, () {
      super.searchTextNameCustomer = value;
    });
  }

  late final _$searchTextNameClientAtom =
      Atom(name: 'OrderControllerBase.searchTextNameClient', context: context);

  @override
  AutoCompleteTextField<dynamic> get searchTextNameClient {
    _$searchTextNameClientAtom.reportRead();
    return super.searchTextNameClient;
  }

  @override
  set searchTextNameClient(AutoCompleteTextField<dynamic> value) {
    _$searchTextNameClientAtom.reportWrite(value, super.searchTextNameClient,
        () {
      super.searchTextNameClient = value;
    });
  }

  late final _$dataOrderModelAtom =
      Atom(name: 'OrderControllerBase.dataOrderModel', context: context);

  @override
  OrderCreateModel get dataOrderModel {
    _$dataOrderModelAtom.reportRead();
    return super.dataOrderModel;
  }

  @override
  set dataOrderModel(OrderCreateModel value) {
    _$dataOrderModelAtom.reportWrite(value, super.dataOrderModel, () {
      super.dataOrderModel = value;
    });
  }

  late final _$schedulingDateAtom =
      Atom(name: 'OrderControllerBase.schedulingDate', context: context);

  @override
  String get schedulingDate {
    _$schedulingDateAtom.reportRead();
    return super.schedulingDate;
  }

  @override
  set schedulingDate(String value) {
    _$schedulingDateAtom.reportWrite(value, super.schedulingDate, () {
      super.schedulingDate = value;
    });
  }

  late final _$paymentAtom =
      Atom(name: 'OrderControllerBase.payment', context: context);

  @override
  String get payment {
    _$paymentAtom.reportRead();
    return super.payment;
  }

  @override
  set payment(String value) {
    _$paymentAtom.reportWrite(value, super.payment, () {
      super.payment = value;
    });
  }

  late final _$statusAtom =
      Atom(name: 'OrderControllerBase.status', context: context);

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$listProductAtom =
      Atom(name: 'OrderControllerBase.listProduct', context: context);

  @override
  List<Map<String, dynamic>> get listProduct {
    _$listProductAtom.reportRead();
    return super.listProduct;
  }

  @override
  set listProduct(List<Map<String, dynamic>> value) {
    _$listProductAtom.reportWrite(value, super.listProduct, () {
      super.listProduct = value;
    });
  }

  late final _$productAtom =
      Atom(name: 'OrderControllerBase.product', context: context);

  @override
  Map<String, dynamic> get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(Map<String, dynamic> value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  late final _$cAtom = Atom(name: 'OrderControllerBase.c', context: context);

  @override
  String get c {
    _$cAtom.reportRead();
    return super.c;
  }

  @override
  set c(String value) {
    _$cAtom.reportWrite(value, super.c, () {
      super.c = value;
    });
  }

  late final _$subtotalAtom =
      Atom(name: 'OrderControllerBase.subtotal', context: context);

  @override
  String get subtotal {
    _$subtotalAtom.reportRead();
    return super.subtotal;
  }

  @override
  set subtotal(String value) {
    _$subtotalAtom.reportWrite(value, super.subtotal, () {
      super.subtotal = value;
    });
  }

  late final _$OrderControllerBaseActionController =
      ActionController(name: 'OrderControllerBase', context: context);

  @override
  dynamic fetchOrderOpen() {
    final _$actionInfo = _$OrderControllerBaseActionController.startAction(
        name: 'OrderControllerBase.fetchOrderOpen');
    try {
      return super.fetchOrderOpen();
    } finally {
      _$OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchOrderDone() {
    final _$actionInfo = _$OrderControllerBaseActionController.startAction(
        name: 'OrderControllerBase.fetchOrderDone');
    try {
      return super.fetchOrderDone();
    } finally {
      _$OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchOrderCanceled() {
    final _$actionInfo = _$OrderControllerBaseActionController.startAction(
        name: 'OrderControllerBase.fetchOrderCanceled');
    try {
      return super.fetchOrderCanceled();
    } finally {
      _$OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateIdCustomer(String value) {
    final _$actionInfo = _$OrderControllerBaseActionController.startAction(
        name: 'OrderControllerBase.validateIdCustomer');
    try {
      return super.validateIdCustomer(value);
    } finally {
      _$OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateIdClient(String value) {
    final _$actionInfo = _$OrderControllerBaseActionController.startAction(
        name: 'OrderControllerBase.validateIdClient');
    try {
      return super.validateIdClient(value);
    } finally {
      _$OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateDate(String value) {
    final _$actionInfo = _$OrderControllerBaseActionController.startAction(
        name: 'OrderControllerBase.validateDate');
    try {
      return super.validateDate(value);
    } finally {
      _$OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePayment(String value) {
    final _$actionInfo = _$OrderControllerBaseActionController.startAction(
        name: 'OrderControllerBase.validatePayment');
    try {
      return super.validatePayment(value);
    } finally {
      _$OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateStatus(String value) {
    final _$actionInfo = _$OrderControllerBaseActionController.startAction(
        name: 'OrderControllerBase.validateStatus');
    try {
      return super.validateStatus(value);
    } finally {
      _$OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ordersOpen: ${ordersOpen},
ordersDone: ${ordersDone},
ordersCanceled: ${ordersCanceled},
searchTextNameCustomer: ${searchTextNameCustomer},
searchTextNameClient: ${searchTextNameClient},
dataOrderModel: ${dataOrderModel},
schedulingDate: ${schedulingDate},
payment: ${payment},
status: ${status},
listProduct: ${listProduct},
product: ${product},
c: ${c},
subtotal: ${subtotal}
    ''';
  }
}

mixin _$FormOrderErrorState on _FormOrderErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormOrderErrorState.hasErrors'))
          .value;

  late final _$idCustomerAtom =
      Atom(name: '_FormOrderErrorState.idCustomer', context: context);

  @override
  String get idCustomer {
    _$idCustomerAtom.reportRead();
    return super.idCustomer;
  }

  @override
  set idCustomer(String value) {
    _$idCustomerAtom.reportWrite(value, super.idCustomer, () {
      super.idCustomer = value;
    });
  }

  late final _$idClientAtom =
      Atom(name: '_FormOrderErrorState.idClient', context: context);

  @override
  String get idClient {
    _$idClientAtom.reportRead();
    return super.idClient;
  }

  @override
  set idClient(String value) {
    _$idClientAtom.reportWrite(value, super.idClient, () {
      super.idClient = value;
    });
  }

  late final _$schedulingDateAtom =
      Atom(name: '_FormOrderErrorState.schedulingDate', context: context);

  @override
  String get schedulingDate {
    _$schedulingDateAtom.reportRead();
    return super.schedulingDate;
  }

  @override
  set schedulingDate(String value) {
    _$schedulingDateAtom.reportWrite(value, super.schedulingDate, () {
      super.schedulingDate = value;
    });
  }

  late final _$paymentAtom =
      Atom(name: '_FormOrderErrorState.payment', context: context);

  @override
  String get payment {
    _$paymentAtom.reportRead();
    return super.payment;
  }

  @override
  set payment(String value) {
    _$paymentAtom.reportWrite(value, super.payment, () {
      super.payment = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_FormOrderErrorState.status', context: context);

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  @override
  String toString() {
    return '''
idCustomer: ${idCustomer},
idClient: ${idClient},
schedulingDate: ${schedulingDate},
payment: ${payment},
status: ${status},
hasErrors: ${hasErrors}
    ''';
  }
}
