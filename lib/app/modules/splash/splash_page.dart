import 'dart:async';
import 'package:application_erp_public_flutter/app/modules/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashController = Modular.get<SplashController>();

  startTime() async {
    Future.delayed(Duration(seconds: 3)).then((v) async {
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
            Container(
              height: 250,
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
            CircularProgressIndicator(
              strokeWidth: 5,
            )
          ],
        ),
      ),
    );
  }
}
