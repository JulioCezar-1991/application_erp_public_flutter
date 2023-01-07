import 'package:application_erp_public_flutter/app/modules/customer/customer_page.dart';
import 'package:application_erp_public_flutter/app/modules/home/home_controller.dart';
import 'package:application_erp_public_flutter/app/modules/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerHomeWidget extends StatefulWidget {
  const DrawerHomeWidget({Key? key}) : super(key: key);

  @override
  State<DrawerHomeWidget> createState() => _DrawerHomeWidgetState();
}

class _DrawerHomeWidgetState extends State<DrawerHomeWidget> {
  final controller = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black26),
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/logo.png',
                  scale: 6.1,
                ),
                Text(
                  "Julio Cezar",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  "Administrador",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text(
              "Gerenciar Usuários",
              style: TextStyle(fontSize: 16.0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CustomerPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.build),
            title: const Text(
              "Configurações",
              style: TextStyle(fontSize: 16.0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingPage()),
              );
            },
          ),
          SizedBox(
            height: size.width / 1.8,
          ),
          const Divider(
            endIndent: 18,
            indent: 18,
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
            ),
            title: const Text(
              "Compartilhar",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.send,
            ),
            title: const Text(
              "Sair",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            onTap: () {
              controller.clearPrefs();
            },
          ),
        ],
      ),
    );
  }
}
