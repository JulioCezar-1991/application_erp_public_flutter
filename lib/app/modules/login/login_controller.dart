// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'package:application_erp_public_flutter/app/shared/models/login_authenticate_model.dart';
import 'package:application_erp_public_flutter/app/shared/repositories/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:validators/validators.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  final FormLoginErrorState error = FormLoginErrorState();
  final LoginRepository repository;

  var loginModel = LoginAuthenticateModel();

  @observable
  String email = '';

  @observable
  String password = '';

  LoginControllerBase(this.repository);

  @action
  void validateEmail(dynamic value) {
    error.email = (isEmail(value) ? null : 'E-mail inválido')!;
  }

  @action
  void validatePassword(dynamic value) {
    error.password =
        (isNull(value) || value.isEmpty ? 'Senha invalida' : null)!;
  }

  Future<LoginAuthenticateModel> authenticate() async {
    var model = LoginAuthenticateModel(
      email: email,
      password: password,
    );

    try {
      var prefs = await SharedPreferences.getInstance();
      var res = await repository.authenticate(model);
      loginModel = res;
      await prefs.setString('customer', jsonEncode(res));

      return res;
    } catch (e) {
      loginModel = model;
      return model.email;
    }
  }

  void validateAll() async {
    validatePassword(password);
    validateEmail(email);
    if (error.password.isNotEmpty && error.email.isNotEmpty) {
      authenticate().then((customer) async {
        if (customer != null) {
          return Modular.to.pushReplacementNamed('/home');
        }
        return null;
      });
    }
  }
}

class FormLoginErrorState = _FormLoginErrorState with _$FormLoginErrorState;

abstract class _FormLoginErrorState with Store {
  @observable
  late String email;

  @observable
  late String password;

  @computed
  bool get hasErrors => email != null || password != null;
}
