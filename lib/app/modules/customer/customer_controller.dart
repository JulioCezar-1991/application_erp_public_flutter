import 'package:application_erp_public_flutter/app/shared/models/customer_create_model.dart';
import 'package:application_erp_public_flutter/app/shared/models/customer_list_model.dart';
import 'package:application_erp_public_flutter/app/shared/models/customer_model.dart';
import 'package:application_erp_public_flutter/app/shared/repositories/customer_repository.dart';
import 'package:mobx/mobx.dart';

import 'package:validators/validators.dart';

part 'customer_controller.g.dart';

class CustomerController = CustomerControllerBase with _$CustomerController;

abstract class CustomerControllerBase with Store {
  final FormCustomerErrorState error = FormCustomerErrorState();
  final CustomerRepository repository;

  List<String> listRoles = [
    'Administrador',
    'Usuário',
  ];

  @observable
  ObservableFuture<List<CustomerListModel>> customers =
      ObservableFuture.value([]);

  @action
  fetchCustomer() {
    customers = repository.getAllCustomer().asObservable();
  }

  CustomerControllerBase(this.repository) {
    fetchCustomer();
  }

  @observable
  String name = '';

  @action
  void validateName(String value) {
    error.name = (isNull(value) || value.isEmpty ? 'Nome inválido' : null)!;
  }

  @observable
  String email = '';

  @action
  void validateEmail(String value) {
    error.email = (isEmail(value) ? null : 'Email inválido')!;
  }

  @observable
  String telcel = '';

  @action
  void validateTelCel(String value) {
    error.telcel =
        (isNull(value) || value.isEmpty ? 'Telefone inválido' : null)!;
  }

  @observable
  String telfix = '';

  @action
  void validateTelFix(String value) {
    error.telfix =
        (isNull(value) || value.isEmpty ? 'Telefone inválido' : null)!;
  }

  @observable
  String roles = '';

  @action
  void validateRoles(String value) {
    error.roles =
        (isNull(value) || value.isEmpty ? 'Telefone inválido' : null)!;
  }

  /*var customer = CustomerModel();*/
  @observable
  String password = '';

  @action
  void validatePassword(String value) {
    error.password =
        (isNull(value) || value.isEmpty ? 'Senha invalida' : null)!;
  }

  @observable
  var dataClientModel = CustomerCreaterModel();

  Future<CustomerModel> _postCreate() async {
    var model = CustomerCreaterModel(
      name: name,
      telcel: telcel,
      telfix: telfix,
      email: email,
    );
    try {
      var res = await repository.customerPost(model);
      return res;
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
      dataClientModel = model;
    }
    return model.email;
  }

  void validateAll() async {
    validateName(name);
    validateTelCel(telcel);
    validateTelFix(telfix);
    validateEmail(email);
    validatePassword(password);
    if (error.name.isNotEmpty &&
        error.email.isNotEmpty &&
        error.telcel.isNotEmpty &&
        error.telfix.isNotEmpty &&
        error.password.isNotEmpty) {
      _postCreate().then((client) async {});
    }
  }
}

class FormCustomerErrorState = FormcustomerErrorState
    with _$FormCustomerErrorState;

abstract class FormcustomerErrorState with Store {
  @observable
  late String name;

  @observable
  late String telcel;

  @observable
  late String telfix;

  @observable
  late String email;

  @observable
  late String password;

  @observable
  late String roles;

  @computed
  bool get hasErrors =>
      name.isEmpty ||
      telcel.isEmpty ||
      telfix.isEmpty ||
      email.isEmpty ||
      password.isEmpty ||
      roles.isEmpty;
}
