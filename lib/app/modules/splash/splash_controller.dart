// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_controller.g.dart';

class SplashController = SplashBase with _$SplashController;

abstract class SplashBase with Store {
  Future loadUser() async {
    var prefs = await SharedPreferences.getInstance();
    var userData = prefs.getString('customer');
    if (userData != null) {
      return Modular.to.pushReplacementNamed('/home');
    }
    return Modular.to.pushReplacementNamed('/login');
  }
}
