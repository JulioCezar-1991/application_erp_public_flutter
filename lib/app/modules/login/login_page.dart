import 'package:application_erp_public_flutter/app/modules/login/login_controller.dart';
import 'package:application_erp_public_flutter/app/shared/components/circle_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final loginrController = Modular.get<LoginController>();

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: size.width / 20, vertical: size.width / 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: size.width / 25, bottom: size.width / 50),
              width: size.width / 2.5,
              child: Image.asset("assets/logo.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Theme.of(context).backgroundColor,
                boxShadow: const [
                  BoxShadow(blurRadius: 2),
                ],
              ),
              child: Form(
                child: Column(
                  children: <Widget>[
                    Observer(
                      builder: (_) {
                        return _textFild(
                            icon: Icons.person,
                            onChanged: (value) =>
                                loginrController.email = value,
                            errorText: loginrController.error.email,
                            context: context,
                            hintText: 'E-Mail',
                            labelText: 'Digite o Email');
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Observer(
                      builder: (_) {
                        return _textFild(
                            obscureText: true,
                            icon: Icons.lock_outline,
                            onChanged: (value) =>
                                loginrController.password = value,
                            errorText: loginrController.error.password,
                            context: context,
                            hintText: 'Senha',
                            labelText: 'Digite a Senha');
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CircleButtonWidget(
              textColor: Colors.white,
              height: 50,
              label: "ENTRAR",
              onTap: () {
                loginrController.validateAll();
              },
              borderColor: null,
            ),
            Padding(
              padding: EdgeInsets.only(top: size.width * 0.12),
              child: Row(
                children: <Widget>[
                  const Expanded(
                      child: Divider(
                    color: Colors.black,
                    height: 15,
                  )),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "NOSSAS REDES",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: size.height / 40,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.width * 0.08),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CircleButtonWidget(
                      height: 45,
                      backgroundColor: Colors.blue,
                      icon: const Icon(
                        FontAwesomeIcons.facebookF,
                        color: Colors.white,
                        size: 18,
                      ),
                      label: "FACEBOOK",
                      onTap: () {},
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                  Expanded(
                    child: CircleButtonWidget(
                      height: 45,
                      backgroundColor: Colors.red[700],
                      icon: const Icon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                        size: 18,
                      ),
                      label: "GOOGLE",
                      onTap: () {},
                      borderColor: null,
                      textColor: null,
                      width: null,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFild(
      {@required icon,
      @required context,
      @required labelText,
      @required hintText,
      bool obscureText = false,
      required ValueChanged onChanged,
      errorText}) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        fillColor: Colors.white,
        enabled: true,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        icon: Icon(
          icon,
          color: Colors.white,
          size: 26,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white, fontSize: 15),
        hintText: hintText,
        hintMaxLines: 20,
        errorText: errorText,
        hintStyle: const TextStyle(
          fontSize: 17.0,
          color: Colors.grey,
          letterSpacing: 2,
          decoration: TextDecoration.none,
        ),
      ),
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    );
  }
}
