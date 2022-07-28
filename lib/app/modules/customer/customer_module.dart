import 'package:application_erp_public_flutter/app/modules/customer/customer_controller.dart';
import 'package:application_erp_public_flutter/app/modules/customer/customer_page.dart';
import 'package:application_erp_public_flutter/app/modules/home/home_module.dart';
import 'package:application_erp_public_flutter/app/shared/repositories/customer_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => CustomerController(i.get<CustomerRepository>())),
        Bind((i) => CustomerRepository(i.get<Dio>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/customer', child: (_, args) => CustomerPage()),
        ModuleRoute('/home', module: HomeModule())
      ];
}
