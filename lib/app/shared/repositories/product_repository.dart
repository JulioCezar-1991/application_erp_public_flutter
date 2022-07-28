import 'package:application_erp_public_flutter/app/shared/models/product_create_model.dart';
import 'package:application_erp_public_flutter/app/shared/models/product_delete_model.dart';
import 'package:application_erp_public_flutter/app/shared/models/product_list_model.dart';
import 'package:application_erp_public_flutter/app/shared/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductRepository {
  final Dio dio;

  ProductRepository(this.dio);

  Future<List<ProductListModel>> getAllProduct() async {
    Response response = await dio.get('/products');
    return (response.data as List)
        .map((item) => ProductListModel.fromJson(item))
        .toList();
  }

  Future<ProductModel> postProduct(ProductCreateModel model) async {
    Response response = await dio.post('/products', data: model);
    debugPrint("resposta: ${response.data}");
    return ProductModel.fromJson(response.data[0]);
  }

  Future<ProductModel> deleteProduct(ProductDeleteModel model) async {
    Response response = await dio.delete('/products', data: model);
    debugPrint("resposta: ${response.statusCode}");
    return ProductModel.fromJson(response.data);
  }

  Future<ProductModel> patchProduct(ProductCreateModel model) async {
    /* if (model.description == null) {} */
    Response response = await dio.patch('/products', data: model);
    debugPrint("resposta: ${response.data}");
    return ProductModel.fromJson(response.data);
  }
}
