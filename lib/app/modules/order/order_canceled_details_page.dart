import 'package:application_erp_public_flutter/app/modules/client/client_controller.dart';
import 'package:application_erp_public_flutter/app/modules/customer/customer_controller.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_canceled_list_model.dart';
import 'package:application_erp_public_flutter/app/modules/order/order_controller.dart';
import 'package:application_erp_public_flutter/app/shared/components/row_client_widget.dart';
import 'package:application_erp_public_flutter/app/shared/components/row_customer_widget.dart';
import 'package:application_erp_public_flutter/app/modules/client/client_list_model.dart';
import 'package:application_erp_public_flutter/app/shared/models/customer_list_model.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class OrderCanceledDetailsPage extends StatefulWidget {
  final OrderCanceledListModel item;

  const OrderCanceledDetailsPage({Key? key, required this.item})
      : super(key: key);

  @override
  State<OrderCanceledDetailsPage> createState() =>
      _OrderCanceledDetailsPageState();
}

class _OrderCanceledDetailsPageState extends State<OrderCanceledDetailsPage> {
  late AutoCompleteTextField searchTextNameCustomer;
  late AutoCompleteTextField searchTextNameClient;

  GlobalKey<AutoCompleteTextFieldState<CustomerListModel>> keyCustomer =
      GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<ClientListModel>> keyClient =
      GlobalKey();

  final _customerController = Modular.get<CustomerController>();
  final _clientController = Modular.get<ClientController>();
  final _orderController = Modular.get<OrderController>();

  final format = DateFormat("dd/MM/yyyy - HH:mm");

  double subTotal() {
    double subTotal = 0;
    for (Itens item in widget.item.itens) {
      subTotal += item.product.price;
    }
    return subTotal;
  }

  @override
  void initState() {
    subTotal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _orderController.status = widget.item.status;
    _orderController.schedulingDate = widget.item.schedulingdate;

    MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detalhes Agendamento",
          style: TextStyle(fontSize: 15),
        ),
        actions: <Widget>[
          // Icone de Atualização //
          IconButton(
            icon: const Icon(
              Icons.update,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title:
                        const Text("Confirmar Atualização da Orde de Serviço"),
                    actions: <Widget>[
                      ElevatedButton(
                        child: Text(
                          "Confirmar",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          try {
                            _orderController.patchOrder(widget.item.sId);
                            _orderController.fetchOrderCanceled();
                            Modular.to.popAndPushNamed(
                              '/home',
                            );
                          } catch (e) {
                            print.call(e);
                          }
                        },
                      ),
                      ElevatedButton(
                        child: Text(
                          "Cancelar",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
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
          // Icone de Delete //
          IconButton(
            icon: const Icon(
              Icons.delete_outline,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Confirmar Exclusão do Serviço"),
                    actions: <Widget>[
                      ElevatedButton(
                        child: Text(
                          "Confirmar",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          try {
                            _orderController.deleteOrder(widget.item.sId);
                            _orderController.fetchOrderCanceled();
                            Modular.to.popAndPushNamed(
                              '/home',
                            );
                          } catch (e) {
                            print.call(e);
                          }
                        },
                      ),
                      ElevatedButton(
                        child: Text(
                          "Cancelar",
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
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
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 12, left: 20, bottom: 6, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Responsavel Pelo Serviço",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Container(
              child: searchTextNameCustomer =
                  AutoCompleteTextField<CustomerListModel>(
                key: keyCustomer,
                clearOnSubmit: false,
                suggestions: _customerController.customers.result,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: widget.item.customer.name,
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black,
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
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nome do Cliente",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Container(
              child: searchTextNameClient =
                  AutoCompleteTextField<ClientListModel>(
                key: keyClient,
                clearOnSubmit: false,
                suggestions: _clientController.clients.result,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: widget.item.client.name,
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black,
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
                      searchTextNameClient.textField?.controller!.text =
                          item.name;
                    },
                  );
                },
                itemBuilder: (context, item) {
                  return RowClientWidget(client: item);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Data do Agendamento",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            DateTimeField(
              format: format,
              initialValue: DateTime.parse(_orderController.schedulingDate),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
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
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );

                  _orderController.schedulingDate = date.toString();
                  return DateTimeField.combine(date, time);
                } else {
                  return currentValue;
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Condição de Pagameno",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 62,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                      shape: BoxShape.rectangle,
                    ),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Estado do Agendamento",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 62,
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 5.0, color: Colors.grey),
                        right: BorderSide(width: 5.0, color: Colors.grey),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      shape: BoxShape.rectangle,
                    ),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tabela de Serviços",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).primaryColor, width: 1.6),
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
                    for (Itens item in widget.item.itens)
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: queryData.size.width / 1.6,
                            child: Text(item.product.title),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: queryData.size.width / 5.5,
                            child: Text(
                              "    ${item.product.price.toString()}",
                            ),
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
                        SizedBox(
                          width: queryData.size.width / 5.5,
                          child: Text(
                            "    ${subTotal()}",
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
