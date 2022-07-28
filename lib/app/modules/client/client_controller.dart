import 'package:application_erp_public_flutter/app/shared/models/client_list_model.dart';
import 'package:application_erp_public_flutter/app/shared/repositories/client_repository.dart';
import 'package:mobx/mobx.dart';

import 'package:validators/validators.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

part 'client_controller.g.dart';

class ClientController = _ClientControllerBase with _$ClientController;

abstract class _ClientControllerBase with Store {
  final FormClientErrorState error = FormClientErrorState();
  final ClientRepository repository;

  @observable
  ObservableFuture<List<ClientListModel>> clients;

  @action
  fetchClient() {
    clients = repository.getAllClient().asObservable();
  }

  _ClientControllerBase(this.repository) {
    fetchClient();
  }

  @observable
  String name = '';

  @action
  void validateName(String value) {
    error.name = isNull(value) || value.isEmpty ? 'Nome inválido' : null;
  }

  @observable
  String cpf = '';

  @action
  void validateCPF(String value) {
    error.cpf = CPFValidator.isValid(value) ? null : 'CPF inválido';
  }

  // Metodos Data Nascimento
  String date = '';

  @observable
  String email = '';

  @action
  void validateEmail(String value) {
    error.email = isEmail(value) ? null : 'Email inválido';
  }

  @observable
  String telcel = '';

  @action
  void validateTelCel(String value) {
    error.telcel = isNull(value) || value.isEmpty ? 'Telefone inválido' : null;
  }

  @observable
  String telfix = '';

  @action
  void validateTelFix(String value) {
    error.telfix = isNull(value) || value.isEmpty ? 'Telefone inválido' : null;
  }

  @observable
  String address = '';

  @action
  void validateAddress(String value) {
    error.address = isNull(value) || value.isEmpty ? 'Endereco inválido' : null;
  }

  @observable
  String sector = '';

  @action
  void validateSector(String value) {
    error.sector = isNull(value) || value.isEmpty ? 'Setor inválido' : null;
  }

  @observable
  String city = '';

  @action
  void validateCity(String value) {
    error.city = isNull(value) || value.isEmpty ? 'Cidade inválida' : null;
  }

  @observable
  String state = '';

  @action
  void validateState(String value) {
    error.state = isNull(value) || value.isEmpty ? 'Estado inválido' : null;
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
      print(ex);
      dataClientModel = null;
    }
    return null;
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
      dataClientModel = null;
    }
    return null;
  }

  void patchClient(String id) async {
    _patchClient(dataClientModel, id);
  }

  Future<ClientModel> _patchClient(ClientCreateModel model, id) async {
    var model = ClientCreateModel(
        id: id,
        name: this.name,
        cpf: this.cpf,
        date: this.date,
        telcel: this.telcel,
        telfix: this.telfix,
        email: this.email,
        address: this.address,
        sector: this.sector,
        city: this.city,
        state: this.state);
    try {
      var res = await repository.patchClient(model);
      return res;
    } catch (error) {
      dataClientModel = null;
    }
    return null;
  }
}

class FormClientErrorState = _FormClientErrorState with _$FormClientErrorState;

abstract class _FormClientErrorState with Store {
  @observable
  String name;

  @observable
  String cpf;

  @observable
  String telcel;

  @observable
  String telfix;

  @observable
  String email;

  @observable
  String address;

  @observable
  String sector;

  @observable
  String city;

  @observable
  String state;

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
