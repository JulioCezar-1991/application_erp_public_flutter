import 'package:application_erp_public_flutter/app/modules/order/order_all_list_model.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_canceled_list_model.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_create_model.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_delete_model.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_done_list_model.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_model.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_open_list_model.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OrderRepository {
  final Dio dio;

  OrderRepository(this.dio);

  Future<List<OrderAllListModel>> getOrderAll() async {
    Response response = await dio.get('/orders');
    return (response.data as List)
        .map((item) => OrderAllListModel.fromJson(item))
        .toList();
  }

  Future<List<OrderOpenListModel>> getOrderOpen() async {
    Response response = await dio.get('/orders/open');
    return (response.data as List)
        .map((item) => OrderOpenListModel.fromJson(item))
        .toList();
  }

  Future<List<OrderDoneListModel>> getOrderDone() async {
    Response response = await dio.get('/orders/done');
    return (response.data as List)
        .map((item) => OrderDoneListModel.fromJson(item))
        .toList();
  }

  Future<List<OrderCanceledListModel>> getOrderCanceled() async {
    Response response = await dio.get('/orders/canceled');
    return (response.data as List)
        .map((item) => OrderCanceledListModel.fromJson(item))
        .toList();
  }

  Future<OrderModel> postOrder(OrderCreateModel model) async {
    Response response = await dio.post('/orders', data: model);
    debugPrint("resposta: ${response.data}");
    return OrderModel.fromJson(response.data);
  }

  Future<OrderModel> deleteOrder(OrderDeleteModel model) async {
    Response response = await dio.delete('/orders', data: model);
    debugPrint("resposta: ${response.statusCode}");
    return OrderModel.fromJson(response.data);
  }

  Future<OrderModel> patchOrder(OrderCreateModel model) async {
    Response response = await dio.patch('/orders', data: model);
    debugPrint("resposta: ${response.data}");
    return OrderModel.fromJson(response.data);
  }
}
