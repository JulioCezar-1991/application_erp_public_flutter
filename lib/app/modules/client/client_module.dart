import 'package:application_erp_public_flutter/app/modules/client/client_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModuleRoute> get routes => [
        ChildRoute('/', child: (_, args) => ClientPage()),
      ];
}
