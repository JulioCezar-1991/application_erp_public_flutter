import 'package:application_erp_public_flutter/app/modules/order/order_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderModule extends Module {
  @override
  List<Bind> get binds => [];

  List<ModularRoute> get routers => [
        ChildRoute('/', child: (_, args) => OrderPage()),
      ];
}
