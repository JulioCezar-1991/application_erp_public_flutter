// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:application_erp_public_flutter/app/shared/models/product_create_model.dart';
import 'package:application_erp_public_flutter/app/shared/models/product_delete_model.dart';
import 'package:application_erp_public_flutter/app/shared/models/product_list_model.dart';
import 'package:application_erp_public_flutter/app/shared/models/product_model.dart';
import 'package:application_erp_public_flutter/app/shared/repositories/product_repository.dart';
import 'package:mobx/mobx.dart';

import 'package:validators/validators.dart';

part 'product_controller.g.dart';

class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store {
  final FormProductErrorState error = FormProductErrorState();
  late final ProductRepository repository;

  @observable
  late ObservableFuture<List<ProductListModel>> products;

  @action
  fetchProduct() {
    products = repository.getAllProduct().asObservable();
  }

  ProductControllerBase(repository) {
    fetchProduct();
  }

  @observable
  String title = '';

  @action
  void validateTitle(String value) {
    error.title = (isNull(value) || value.isEmpty ? 'Nome inválido' : null)!;
  }

  @observable
  String price = '';

  @action
  void validatePrice(String value) {
    error.price = (isNull(value) || value.isEmpty ? 'Valor invalida' : null)!;
  }

  @observable
  String type = 'Tipo de Serviço';

  @action
  void validateType(String value) {
    error.type =
        (isNull(value) || value.isEmpty ? 'Tipo de Serviço inválido' : null)!;
  }

  List<String> listType = [
    'Tipo de Serviço',
    'Pintura das Unhas',
    'Pintura de Cabelo',
    'Depilação',
    'Lavagem',
    'Corte',
  ];

  String averagetime = '';

  @action
  void validateAveragetime(String value) {
    error.averagetime =
        (isNull(value) || value.isEmpty ? 'Tempo de serviço inválido' : null)!;
  }

  @observable
  String description = '';

  @action
  void validateDescription(String value) {
    error.description =
        (isNull(value) || value.isEmpty ? 'Descrição invalida' : null)!;
  }

  @observable
  var dataProductModel = ProductCreateModel();

  Future<ProductModel> _postCreate() async {
    var model = ProductCreateModel(
        title: title,
        description: description,
        averagetime: averagetime,
        type: type,
        price: double.parse(price));
    try {
      var res = await repository.postProduct(model);
      return res;
    } catch (ex) {
      print(ex);
      dataProductModel = model;
    }
    return model.id;
  }

  void validateAll() async {
    validateTitle(title);
    validatePrice(price.toString());
    validateDescription(description);
    if (error.title == null &&
        error.description == null &&
        error.price == null &&
        error.type == null) {
      _postCreate().then((procuct) async {});
    }
  }

  void deleteProduct(String id) async {
    _deleteProduct(id);
  }

  Future<ProductModel> _deleteProduct(String id) async {
    var model = ProductDeleteModel(id: id);
    try {
      var res = await repository.deleteProduct(model);
      return res;
    } catch (error) {
      dataProductModel = model.id;
    }
    return model.id;
  }

  void patchProduct(String id) async {
    _patchProduct(dataProductModel, id);
  }

  Future<ProductModel> _patchProduct(ProductCreateModel model, id) async {
    var model = ProductCreateModel(
      id: id,
      title: title,
      price: price == "" ? null : double.parse(price),
      type: type,
      averagetime: averagetime,
      description: description,
    );
    try {
      var res = await repository.patchProduct(model);
      return res;
    } catch (error) {
      dataProductModel = model;
    }
    return model.id;
  }
}

class FormProductErrorState = FormProductError with _$FormProductErrorState;

abstract class FormProductError with Store {
  @observable
  late String title;

  @observable
  late String price;

  @observable
  late String averagetime;

  @observable
  late String type;

  @observable
  late String description;

  @computed
  bool get hasErrors =>
      title != null ||
      price != null ||
      averagetime != null ||
      type != null ||
      description != null;
}
