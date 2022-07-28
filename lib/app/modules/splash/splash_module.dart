import 'package:application_erp_public_flutter/app/modules/home/home_module.dart';
import 'package:application_erp_public_flutter/app/modules/login/login_module.dart';
import 'package:application_erp_public_flutter/app/modules/splash/splash_controller.dart';
import 'package:application_erp_public_flutter/app/modules/splash/splash_page.dart';

import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/splash', child: (_, args) => SplashPage()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule())
      ];
}
