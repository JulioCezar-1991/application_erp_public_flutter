// ignore_for_file: deprecated_member_use

import 'package:application_erp_public_flutter/app/modules/client/client_controller.dart';
import 'package:application_erp_public_flutter/app/modules/customer/customer_controller.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_controller.dart';
import 'package:application_erp_public_flutter/app/modules/product/product_controller.dart';
import 'package:application_erp_public_flutter/app/shared/components/row_client_widget.dart';
import 'package:application_erp_public_flutter/app/shared/components/row_customer_widget.dart';
import 'package:application_erp_public_flutter/app/shared/components/row_product_widget.dart';
import 'package:application_erp_public_flutter/app/modules/client/client_list_model.dart';
import 'package:application_erp_public_flutter/app/shared/models/customer_list_model.dart';
import 'package:application_erp_public_flutter/app/shared/models/product_list_model.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class OrderCreatePage extends StatefulWidget {
  const OrderCreatePage({Key? key}) : super(key: key);

  @override
  State<OrderCreatePage> createState() => _OrderCreatePageState();
}

class _OrderCreatePageState extends State<OrderCreatePage> {
  late AutoCompleteTextField searchTextNameCustomer;
  late AutoCompleteTextField searchTextNameClient;
  late AutoCompleteTextField searchTextNameProduct;

  GlobalKey<AutoCompleteTextFieldState<CustomerListModel>> keyCustomer =
      GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<ClientListModel>> keyClient =
      GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<ProductListModel>> keyProduct =
      GlobalKey();

  final _customerController = Modular.get<CustomerController>();
  final _clientController = Modular.get<ClientController>();
  final _productController = Modular.get<ProductController>();
  final _orderController = Modular.get<OrderController>();

  final format = DateFormat("yyyy-MM-dd HH:mm");

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Agendamento"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              icon: const Icon(
                Icons.check,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Confirmar Agendamento"),
                      actions: <Widget>[
                        ElevatedButton(
                          child: Text(
                            "Salvar",
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                          onPressed: () {
                            _orderController.validateCreateAll();
                            _orderController.fetchOrderDone();
                            _orderController.fetchOrderOpen();
                            _orderController.fetchOrderCanceled();

                            Modular.to.pushReplacementNamed(
                              '/home',
                            );
                          },
                        ),
                        ElevatedButton(
                          child: Text(
                            "Cancelar",
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 12, left: 20, bottom: 6, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: const Icon(
                    Icons.perm_data_setting,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: queryData.size.width / 1.301,
                  child: searchTextNameCustomer =
                      AutoCompleteTextField<CustomerListModel>(
                    key: keyCustomer,
                    clearOnSubmit: false,
                    suggestions: _customerController.customers.result,
                    style: const TextStyle(color: Colors.black, fontSize: 16.0),
                    decoration: InputDecoration(
                      hintText: "Pesquisa por nome",
                      alignLabelWithHint: false,
                      counterStyle: const TextStyle(color: Colors.transparent),
                      labelText: "Responsavel pelo serviço",
                      labelStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    itemFilter: (item, query) {
                      return item.name
                          .toLowerCase()
                          .startsWith(query.toLowerCase());
                    },
                    itemSorter: (a, b) {
                      return a.name.compareTo(b.name);
                    },
                    itemSubmitted: (item) {
                      _orderController.idCustomer = item.sId;
                      setState(
                        () {
                          searchTextNameCustomer.textField?.controller?.text =
                              item.name;
                        },
                      );
                    },
                    itemBuilder: (context, item) {
                      return RowCustomerWidget(customer: item);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: queryData.size.width / 1.301,
                  child: searchTextNameClient =
                      AutoCompleteTextField<ClientListModel>(
                    key: keyClient,
                    clearOnSubmit: false,
                    suggestions: _clientController.clients.result,
                    style: const TextStyle(color: Colors.black, fontSize: 16.0),
                    decoration: InputDecoration(
                      hintText: "Pesquisa por nome",
                      alignLabelWithHint: false,
                      counterStyle: const TextStyle(color: Colors.transparent),
                      labelText: "Nome do Cliente",
                      labelStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    itemFilter: (item, query) {
                      return item.name
                          .toLowerCase()
                          .startsWith(query.toLowerCase());
                    },
                    itemSorter: (a, b) {
                      return a.name.compareTo(b.name);
                    },
                    itemSubmitted: (item) {
                      _orderController.idClient = item.sId;
                      setState(
                        () {
                          searchTextNameClient.textField?.controller?.text =
                              item.name;
                        },
                      );
                    },
                    itemBuilder: (context, item) {
                      return RowClientWidget(client: item);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: const Icon(
                    Icons.timer,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: DateTimeField(
                    format: format,
                    decoration: InputDecoration(
                      labelText: "Data do agendamento",
                      labelStyle:
                          TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onShowPicker: (context, currentValue) async {
                      final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2020),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2050));
                      if (date != null) {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()),
                        );
                        _orderController.schedulingDate = date.toString();
                        return DateTimeField.combine(date, time);
                      } else {
                        print(currentValue);
                        return currentValue;
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: const Icon(
                    Icons.description,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: Observer(
                      builder: (_) => DropdownButton(
                        value: _orderController.status,
                        isExpanded: true,
                        icon: Icon(
                          Icons.arrow_downward,
                          color: Theme.of(context).primaryColor,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        underline: Container(
                          height: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                        items: _orderController.listStatus
                            .map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        onChanged: (dynamic newValue) {
                          _orderController.status = newValue;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: const Icon(
                    Icons.attach_money,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: Observer(
                      builder: (_) => DropdownButton(
                        value: _orderController.payment,
                        isExpanded: true,
                        icon: Icon(
                          Icons.arrow_downward,
                          color: Theme.of(context).primaryColor,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        underline: Container(
                          height: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                        items: _orderController.listFormPayment
                            .map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        onChanged: (dynamic newValue) {
                          _orderController.payment = newValue;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(right: 16),
                  child: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: queryData.size.width / 1.29,
                  child: searchTextNameProduct =
                      AutoCompleteTextField<ProductListModel>(
                    key: keyProduct,
                    clearOnSubmit: false,
                    suggestions: _productController.products.result,
                    style: const TextStyle(color: Colors.black, fontSize: 16.0),
                    decoration: InputDecoration(
                      hintText: "Pesquisa por nome",
                      alignLabelWithHint: false,
                      counterStyle: const TextStyle(color: Colors.transparent),
                      labelText: "Nome do Serviço",
                      labelStyle: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    itemFilter: (item, query) {
                      return item.title
                          .toLowerCase()
                          .startsWith(query.toLowerCase());
                    },
                    itemSorter: (a, b) {
                      return a.title.compareTo(b.title);
                    },
                    itemSubmitted: (item) {
                      _orderController.product = {
                        'title': item.title,
                        'product': item.sId,
                        'price': item.price,
                        'quantity': 1
                      };

                      _orderController.listProduct
                          .add(_orderController.product);

                      setState(
                        () {
                          searchTextNameProduct.textField?.controller?.text =
                              item.title;
                        },
                      );
                    },
                    itemBuilder: (context, item) {
                      return RowProductWidget(product: item);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).accentColor, width: 1.6),
                borderRadius: BorderRadius.circular(5),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 5),
                      child: Row(
                        children: <Widget>[
                          const Text(
                            "Serviços",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            width: queryData.size.width / 2.1,
                          ),
                          const Text(
                            "  Valor",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                    for (Map<String, dynamic> p in _orderController.listProduct)
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: queryData.size.width / 1.6,
                            child: Text(p['title']),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: queryData.size.width / 5.5,
                            child: Text('   ${p['price'].toString()}'),
                          ),
                        ],
                      ),
                    const Divider(),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: queryData.size.width / 1.6,
                          child: const Text('Total:'),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Observer(
                          builder: (_) => SizedBox(
                            width: queryData.size.width / 5.5,
                            child: Text(
                              '   ${_orderController.changeSubtotal()}',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
