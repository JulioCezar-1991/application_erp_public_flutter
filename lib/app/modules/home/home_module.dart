import 'package:application_erp_public_flutter/app/modules/client/client_controller.dart';
import 'package:application_erp_public_flutter/app/modules/client/client_module.dart';
import 'package:application_erp_public_flutter/app/modules/customer/customer_controller.dart';
import 'package:application_erp_public_flutter/app/modules/home/home_controller.dart';
import 'package:application_erp_public_flutter/app/modules/home/home_page.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_controller.dart';
import 'package:application_erp_public_flutter/app/modules/product/product_controller.dart';
import 'package:application_erp_public_flutter/app/modules/product/product_module.dart';
import 'package:application_erp_public_flutter/app/shared/repositories/client_repository.dart';
import 'package:application_erp_public_flutter/app/shared/repositories/customer_repository.dart';
import 'package:application_erp_public_flutter/app/shared/repositories/order_repository.dart';
import 'package:application_erp_public_flutter/app/shared/repositories/product_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => CustomerController(i.get<CustomerRepository>())),
        Bind((i) => CustomerRepository(i.get<Dio>())),
        Bind((i) => ClientController(i.get<ClientRepository>())),
        Bind((i) => ClientRepository(i.get<Dio>())),
        Bind((i) => ProductController(i.get<ProductRepository>())),
        Bind((i) => ProductRepository(i.get<Dio>())),
        Bind((i) => OrderController(i.get<OrderRepository>())),
        Bind((i) => OrderRepository(i.get<Dio>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ModuleRoute('/client', module: ClientModule()),
        ModuleRoute('/product', module: ProductModule()),
      ];
}
