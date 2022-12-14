import 'package:application_erp_public_flutter/app/modules/client/client_controller.dart';
import 'package:application_erp_public_flutter/app/shared/components/client_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'client_list_model.dart';

class ClientPage extends StatelessWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clientController = Modular.get<ClientController>();
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (clientController.clients.error != null) {
            return Center(
              child: IconButton(
                icon: const Icon(
                  Icons.replay,
                  size: 40,
                ),
                onPressed: () {
                  clientController.fetchClient();
                },
              ),
            );
          }
          if (clientController.clients.value == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<ClientListModel>? list = clientController.clients.result;
          return ListView.builder(
            itemCount: list?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: ClientCard(
                  item: list![index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
