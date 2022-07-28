import 'package:application_erp_public_flutter/app/shared/models/product_list_model.dart';
import 'package:flutter/material.dart';

class RowProductWidget extends StatelessWidget {
  final ProductListModel product;

  const RowProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            product.title,
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
      ],
    );
  }
}
