import 'package:application_erp_public_flutter/app/modules/customer/customer_controller.dart';
import 'package:application_erp_public_flutter/app/modules/customer/customer_create.page.dart';
import 'package:application_erp_public_flutter/app/shared/components/customer_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomerPage extends StatelessWidget {
  final String _title = "Gerencia de Usuários";

  const CustomerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final customerController = Modular.get<CustomerController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "  $_title",
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              customerController.fetchCustomer();
            },
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Observer(
        builder: (_) {
          if (customerController.customers.error != null) {
            return Center(
              child: IconButton(
                icon: const Icon(
                  Icons.replay,
                  size: 40,
                ),
                onPressed: () {
                  customerController.fetchCustomer();
                },
              ),
            );
          }
          if (customerController.customers.value == null) {
            return const Center(child: CircularProgressIndicator());
          }
          var list = customerController.customers.value;
          return ListView.builder(
            itemCount: list?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: CustomerCard(
                  item: list![index],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const CustomerCreatePage()));
          }),
    );
  }
}
