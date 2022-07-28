// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on ProductControllerBase, Store {
  late final _$productsAtom =
      Atom(name: 'ProductControllerBase.products', context: context);

  @override
  ObservableFuture<List<ProductListModel>> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableFuture<List<ProductListModel>> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$titleAtom =
      Atom(name: 'ProductControllerBase.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$priceAtom =
      Atom(name: 'ProductControllerBase.price', context: context);

  @override
  String get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$typeAtom =
      Atom(name: 'ProductControllerBase.type', context: context);

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'ProductControllerBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$dataProductModelAtom =
      Atom(name: 'ProductControllerBase.dataProductModel', context: context);

  @override
  ProductCreateModel get dataProductModel {
    _$dataProductModelAtom.reportRead();
    return super.dataProductModel;
  }

  @override
  set dataProductModel(ProductCreateModel value) {
    _$dataProductModelAtom.reportWrite(value, super.dataProductModel, () {
      super.dataProductModel = value;
    });
  }

  late final _$ProductControllerBaseActionController =
      ActionController(name: 'ProductControllerBase', context: context);

  @override
  dynamic fetchProduct() {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.fetchProduct');
    try {
      return super.fetchProduct();
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateTitle(String value) {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.validateTitle');
    try {
      return super.validateTitle(value);
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePrice(String value) {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.validatePrice');
    try {
      return super.validatePrice(value);
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateType(String value) {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.validateType');
    try {
      return super.validateType(value);
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAveragetime(String value) {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.validateAveragetime');
    try {
      return super.validateAveragetime(value);
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateDescription(String value) {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.validateDescription');
    try {
      return super.validateDescription(value);
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
title: ${title},
price: ${price},
type: ${type},
description: ${description},
dataProductModel: ${dataProductModel}
    ''';
  }
}

mixin _$FormProductErrorState on FormProductError, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: 'FormProductError.hasErrors'))
          .value;

  late final _$titleAtom =
      Atom(name: 'FormProductError.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$priceAtom =
      Atom(name: 'FormProductError.price', context: context);

  @override
  String get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(String value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$averagetimeAtom =
      Atom(name: 'FormProductError.averagetime', context: context);

  @override
  String get averagetime {
    _$averagetimeAtom.reportRead();
    return super.averagetime;
  }

  @override
  set averagetime(String value) {
    _$averagetimeAtom.reportWrite(value, super.averagetime, () {
      super.averagetime = value;
    });
  }

  late final _$typeAtom = Atom(name: 'FormProductError.type', context: context);

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'FormProductError.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  @override
  String toString() {
    return '''
title: ${title},
price: ${price},
averagetime: ${averagetime},
type: ${type},
description: ${description},
hasErrors: ${hasErrors}
    ''';
  }
}
