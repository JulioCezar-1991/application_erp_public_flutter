import 'package:application_erp_public_flutter/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'setting_page.dart';

class SettingModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/setting', child: (_, args) => SettingPage()),
        ModuleRoute('/home', module: HomeModule())
      ];
}
