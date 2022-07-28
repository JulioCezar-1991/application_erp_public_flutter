// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:application_erp_public_flutter/app/shared/models/client_create_model.dart';
import 'package:application_erp_public_flutter/app/shared/models/client_delete_model.dart';
import 'package:application_erp_public_flutter/app/shared/models/client_list_model.dart';
import 'package:application_erp_public_flutter/app/shared/models/client_model.dart';
import 'package:application_erp_public_flutter/app/shared/repositories/client_repository.dart';
import 'package:mobx/mobx.dart';

import 'package:validators/validators.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

part 'client_controller.g.dart';

class ClientController = ClientControllerBase with _$ClientController;

abstract class ClientControllerBase with Store {
  final FormClientErrorState error = FormClientErrorState();
  late final ClientRepository repository;

  @observable
  late ObservableFuture<List<ClientListModel>> clients;

  @action
  fetchClient() {
    clients = repository.getAllClient().asObservable();
  }

  ClientControllerBase(repository) {
    fetchClient();
  }

  @observable
  String name = '';

  @action
  void validateName(String value) {
    error.name = (isNull(value) || value.isEmpty ? 'Nome inválido' : null)!;
  }

  @observable
  String cpf = '';

  @action
  void validateCPF(String value) {
    error.cpf = (CPFValidator.isValid(value) ? null : 'CPF inválido')!;
  }

  // Metodos Data Nascimento
  String date = '';

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
  String address = '';

  @action
  void validateAddress(String value) {
    error.address =
        (isNull(value) || value.isEmpty ? 'Endereco inválido' : null)!;
  }

  @observable
  String sector = '';

  @action
  void validateSector(String value) {
    error.sector = (isNull(value) || value.isEmpty ? 'Setor inválido' : null)!;
  }

  @observable
  String city = '';

  @action
  void validateCity(String value) {
    error.city = (isNull(value) || value.isEmpty ? 'Cidade inválida' : null)!;
  }

  @observable
  String state = '';

  @action
  void validateState(String value) {
    error.state = (isNull(value) || value.isEmpty ? 'Estado inválido' : null)!;
  }

  @observable
  var dataClientModel = ClientCreateModel();

  Future<ClientModel> _postCreate() async {
    var model = ClientCreateModel(
        name: name,
        cpf: cpf,
        date: date,
        telcel: telcel,
        telfix: telfix,
        email: email,
        address: address,
        sector: sector,
        city: city,
        state: state);
    try {
      var res = await repository.postClient(model);
      return res;
    } catch (ex) {
      // ignore: avoid_print
      print(ex);
      dataClientModel = model;
    }
    return model.id;
  }

  void validateCreateAll() async {
    validateName(name);
    validateCPF(cpf);
    validateEmail(email);
    validateTelCel(telcel);
    validateTelFix(telfix);
    validateAddress(address);
    validateSector(sector);
    validateCity(city);
    validateState(state);
    if (error.name == null &&
        error.cpf == null &&
        error.email == null &&
        error.telcel == null &&
        error.telfix == null &&
        error.address == null &&
        error.sector == null &&
        error.city == null &&
        error.state == null) {
      _postCreate().then((client) async {});
    }
  }

  void deleteClient(String id) async {
    _deleteClient(id);
  }

  Future<ClientModel> _deleteClient(id) async {
    var model = ClientDeleteModel(id: id);
    try {
      var res = await repository.deleteClient(model);
      return res;
    } catch (error) {
      dataClientModel = model.id;
    }
    return model.id;
  }

  void patchClient(String id) async {
    _patchClient(dataClientModel, id);
  }

  Future<ClientModel> _patchClient(ClientCreateModel model, id) async {
    var model = ClientCreateModel(
        id: id,
        name: name,
        cpf: cpf,
        date: date,
        telcel: telcel,
        telfix: telfix,
        email: email,
        address: address,
        sector: sector,
        city: city,
        state: state);
    try {
      var res = await repository.patchClient(model);
      return res;
    } catch (error) {
      dataClientModel = model;
    }
    return model.id;
  }
}

class FormClientErrorState = FormClientError with _$FormClientErrorState;

abstract class FormClientError with Store {
  @observable
  late String name;

  @observable
  late String cpf;

  @observable
  late String telcel;

  @observable
  late String telfix;

  @observable
  late String email;

  @observable
  late String address;

  @observable
  late String sector;

  @observable
  late String city;

  @observable
  late String state;

  @computed
  bool get hasErrors =>
      name != null ||
      cpf != null ||
      telcel != null ||
      telfix != null ||
      email != null ||
      address != null ||
      sector != null ||
      city != null ||
      state != null;
}
