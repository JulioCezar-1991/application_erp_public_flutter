import 'package:application_erp_public_flutter/app/shared/models/client_list_model.dart';
import 'package:flutter/material.dart';

class RowClientWidget extends StatelessWidget {
  final ClientListModel client;

  const RowClientWidget({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            client.name,
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
      ],
    );
  }
}
