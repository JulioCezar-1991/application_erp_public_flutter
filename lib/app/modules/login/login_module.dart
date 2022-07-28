import 'package:application_erp_public_flutter/app/modules/home/home_module.dart';
import 'package:application_erp_public_flutter/app/modules/login/login_controller.dart';
import 'package:application_erp_public_flutter/app/modules/login/login_page.dart';
import 'package:application_erp_public_flutter/app/shared/repositories/login_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i.get<LoginRepository>())),
        Bind((i) => LoginRepository(i.get<Dio>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/login', child: (_, args) => const LoginPage()),
        ModuleRoute('/home', module: HomeModule())
      ];
}
