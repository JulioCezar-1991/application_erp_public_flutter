import 'package:mobx/mobx.dart';

part 'setting_controller.g.dart';

class SettingController = SettingControllerBase with _$SettingController;

abstract class SettingControllerBase with Store {
  final FormSettingErrorState error = FormSettingErrorState();
}

class FormSettingErrorState = FormSettingError with _$FormSettingErrorState;

abstract class FormSettingError with Store {}
