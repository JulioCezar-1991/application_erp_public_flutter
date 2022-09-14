import 'package:application_erp_public_flutter/app/modules/home/home_module.dart';
import 'package:application_erp_public_flutter/app/modules/splash/splash_module.dart';
import 'package:application_erp_public_flutter/app/shared/utils/setting_util.dart';
import 'package:dio/dio.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => Dio(BaseOptions(baseUrl: Settings.apiUrl))),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
      ];
}
