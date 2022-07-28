import 'package:application_erp_public_flutter/app/shared/models/customer_list_model.dart';
import 'package:flutter/material.dart';

class RowCustomerWidget extends StatelessWidget {
  final CustomerListModel customer;

  const RowCustomerWidget({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            customer.name,
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
      ],
    );
  }
}
