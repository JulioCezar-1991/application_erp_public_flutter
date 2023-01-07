import 'package:application_erp_public_flutter/app/modules/client/client_create_model.dart';
import 'package:application_erp_public_flutter/app/modules/client/client_delete_model.dart';
import 'package:application_erp_public_flutter/app/modules/client/client_list_model.dart';
import 'package:application_erp_public_flutter/app/modules/client/client_model.dart';
import 'package:application_erp_public_flutter/app/modules/client/client_repository.dart';
import 'package:mobx/mobx.dart';

import 'package:validators/validators.dart';
import 'package:cpf_cnpj_validator/cpf_validator.dart';

part 'client_controller.g.dart';

class ClientController = ClientControllerBase with _$ClientController;

abstract class ClientControllerBase with Store {
  final FormClientErrorState error = FormClientErrorState();
  final ClientRepository repository;

  @observable
  ObservableFuture<List<ClientListModel>> clients = ObservableFuture.value([]);

  @action
  fetchClient() {
    clients = repository.getAllClient().asObservable();
  }

  ClientControllerBase(this.repository) {
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
  var dataClientModel = ClientCreateModel(
      address: '',
      city: '',
      cpf: '',
      date: '',
      email: '',
      id: '',
      name: '',
      sector: '',
      state: '',
      telcel: '',
      telfix: '');

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
        state: state,
        id: '');

    var res = await repository.postClient(model);

    return res;
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
    if (error.name.isNotEmpty &&
        error.cpf.isNotEmpty &&
        error.email.isNotEmpty &&
        error.telcel.isNotEmpty &&
        error.telfix.isNotEmpty &&
        error.address.isNotEmpty &&
        error.sector.isNotEmpty &&
        error.city.isNotEmpty &&
        error.state.isNotEmpty) {
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
      print.call(error);
    }
    return id;
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
      print.call(error);
    }
    return id;
  }
}

class FormClientErrorState = _FormClientErrorState with _$FormClientErrorState;

abstract class _FormClientErrorState with Store {
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
      name.isNotEmpty ||
      cpf.isNotEmpty ||
      telcel.isNotEmpty ||
      telfix.isNotEmpty ||
      email.isNotEmpty ||
      address.isNotEmpty ||
      sector.isNotEmpty ||
      city.isNotEmpty ||
      state.isNotEmpty;
}
