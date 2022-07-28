import 'dart:async';
import 'package:application_erp_public_flutter/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashController = Modular.get<SplashController>();

  startTime() async {
    Future.delayed(const Duration(seconds: 3)).then((v) async {
      return splashController.loadUser();
    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              height: 250,
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
            const CircularProgressIndicator(
              strokeWidth: 5,
            )
          ],
        ),
      ),
    );
  }
}
