// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:application_erp_public_flutter/app/modules/order/order_canceled_list_model.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_create_model.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_delete_model.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_done_list_model.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_model.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_open_list_model.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_repository.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:mobx/mobx.dart';

import 'package:validators/validators.dart';

part 'order_controller.g.dart';

class OrderController = OrderControllerBase with _$OrderController;

abstract class OrderControllerBase with Store {
  final FormOrderErrorState error = FormOrderErrorState();
  final OrderRepository repository;

  List<String> listStatus = [
    'Status do Serviço',
    'Aberto',
    'Fechado',
    'Cancelado',
  ];

  List<String> listFormPayment = [
    'Forma de Pagamento',
    'Dinheiro',
    'Cartão de Credito',
    'Cartão de Debito',
    'Carteira'
  ];

  @observable
  ObservableFuture<List<OrderOpenListModel>> ordersOpen =
      ObservableFuture.value([]);

  @action
  fetchOrderOpen() {
    ordersOpen = repository.getOrderOpen().asObservable();
  }

  @observable
  ObservableFuture<List<OrderDoneListModel>> ordersDone =
      ObservableFuture.value([]);

  @action
  fetchOrderDone() {
    ordersDone = repository.getOrderDone().asObservable();
  }

  @observable
  ObservableFuture<List<OrderCanceledListModel>> ordersCanceled =
      ObservableFuture.value([]);

  @action
  fetchOrderCanceled() {
    ordersCanceled = repository.getOrderCanceled().asObservable();
  }

  OrderControllerBase(this.repository) {
    fetchOrderOpen();
    fetchOrderDone();
    fetchOrderCanceled();
  }

  @observable
  late AutoCompleteTextField searchTextNameCustomer;

  @observable
  late AutoCompleteTextField searchTextNameClient;

  @observable
  var dataOrderModel = OrderCreateModel();

  String idCustomer = '';

  @action
  void validateIdCustomer(String value) {
    error.idCustomer =
        (isNull(value) || value.isEmpty ? 'IdUser inválido' : null)!;
  }

  String idClient = '';

  @action
  void validateIdClient(String value) {
    error.idClient =
        (isNull(value) || value.isEmpty ? 'IdClient inválido' : null)!;
  }

  @observable
  String schedulingDate = '';

  @action
  void validateDate(String value) {
    error.schedulingDate =
        (isNull(value) || value.isEmpty ? 'Data Invalida inválido' : null)!;
  }

  @observable
  String payment = 'Forma de Pagamento';

  @action
  void validatePayment(String value) {
    error.payment = (isNull(value) || value.isEmpty
        ? 'Forma de Pagamento Inválido'
        : null)!;
  }

  @observable
  String status = 'Status do Serviço';

  @action
  void validateStatus(String value) {
    error.status = (isNull(value) || value.isEmpty ? 'Status Inválido' : null)!;
  }

  @observable
  List<Map<String, dynamic>> listProduct = [];

  @observable
  Map<String, dynamic> product = {};

  @observable
  String c = '';

  @observable
  String subtotal = '';

  String changeSubtotal() {
    double subTotal = 0;
    for (product in listProduct) {
      subTotal += product['price'];
    }
    return subtotal = subTotal.toString();
  }

  Future<OrderModel> _postCreate() async {
    var model = OrderCreateModel(
      customer: idCustomer,
      client: idClient,
      schedulingdate: schedulingDate,
      status: status,
      items: listProduct,
      formPayment: payment,
      subtotal: 123,
    );

    try {
      var res = await repository.postOrder(model);
      return res;
    } catch (ex) {
      dataOrderModel = model;
    }
    return model.id;
  }

  void patchOrder(String id) async {
    _patchOrder(dataOrderModel, id);
  }

  Future<OrderModel> _patchOrder(OrderCreateModel model, id) async {
    var model = OrderCreateModel(
      id: id,
      customer: idCustomer,
      client: idClient,
      schedulingdate: schedulingDate,
      formPayment: payment,
      /*  itens: itens, */
      status: status,
    );
    try {
      var res = await repository.patchOrder(model);
      return res;
    } catch (error) {
      dataOrderModel = model;
    }
    return model.id;
  }

  void deleteOrder(String id) async {
    _deleteOrder(id);
  }

  Future<OrderModel> _deleteOrder(String id) async {
    var model = OrderDeleteModel(id: id);
    try {
      var res = await repository.deleteOrder(model);
      return res;
    } catch (error) {
      dataOrderModel = model.id;
    }
    return model.id;
  }

  void validateCreateAll() async {
    validateIdCustomer(idCustomer);
    validateIdClient(idClient);
    validateDate(schedulingDate);
    validateStatus(status);
    validatePayment(payment);

    if (error.idCustomer.isEmpty &&
        error.idClient.isEmpty &&
        error.schedulingDate.isEmpty &&
        error.status.isEmpty &&
        error.payment.isEmpty) {
      return _postCreate().then((order) async {});
    }
  }
}

class FormOrderErrorState = _FormOrderErrorState with _$FormOrderErrorState;

abstract class _FormOrderErrorState with Store {
  @observable
  late String idCustomer;

  @observable
  late String idClient;

  @observable
  late String schedulingDate;

  @observable
  late String payment;

  @observable
  late String status;

  @computed
  bool get hasErrors =>
      idCustomer.isNotEmpty ||
      idClient.isNotEmpty ||
      schedulingDate.isNotEmpty ||
      payment.isNotEmpty ||
      status.isNotEmpty;
}
