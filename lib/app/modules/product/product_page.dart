import 'package:application_erp_public_flutter/app/modules/product/product_controller.dart';
import 'package:application_erp_public_flutter/app/shared/components/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Modular.get<ProductController>();
    return Scaffold(
      body: Observer(
        builder: (_) {
          if (productController.products.error != null) {
            return Center(
              child: IconButton(
                icon: const Icon(
                  Icons.replay,
                  size: 40,
                ),
                onPressed: () {
                  productController.fetchProduct();
                },
              ),
            );
          }
          if (productController.products.value == null) {
            return const Center(child: CircularProgressIndicator());
          }
          var list = productController.products.value;
          return ListView.builder(
            itemCount: list?.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: ProductCard(
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
