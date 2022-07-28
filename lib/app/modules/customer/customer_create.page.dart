// ignore_for_file: deprecated_member_use

import 'package:application_erp_public_flutter/app/modules/customer/customer_controller.dart';
import 'package:application_erp_public_flutter/app/shared/components/text_field_create_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomerCreatePage extends StatefulWidget {
  const CustomerCreatePage({Key? key}) : super(key: key);

  @override
  _CustomerCreatePageState createState() => _CustomerCreatePageState();
}

class _CustomerCreatePageState extends State<CustomerCreatePage> {
  final _customerController = Modular.get<CustomerController>();

  var maskTelFixFormatter = MaskTextInputFormatter(
      mask: "(##) ####-####", filter: {"#": RegExp(r'[0-9]')});

  final format = DateFormat("HH:mm");
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cadastrar Novo Serviço",
        ),
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
                      title: const Text("Confirmar Cadastro do Produto"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            "Salvar",
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                          onPressed: () {
                            _customerController.validateAll();
                            _customerController.fetchCustomer();
                            Modular.to.pushReplacementNamed(
                              '/home',
                            );
                          },
                        ),
                        FlatButton(
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Observer(
              builder: (_) => Padding(
                padding: const EdgeInsets.only(top: 0),
                child: TextFieldCreate(
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  icon: const Icon(
                    Icons.person,
                    size: 26,
                  ),
                  hintText: 'Digite o nome',
                  labelText: 'Nome do Usuário',
                  onChanged: (value) {
                    _customerController.name = value;
                  },
                  errorText: _customerController.error.name,
                ),
              ),
            ),
            Observer(
              builder: (_) => Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFieldCreate(
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 6,
                  icon: const Icon(
                    Icons.email,
                    size: 26,
                  ),
                  hintText: 'Digite o E-mail',
                  labelText: 'E-mail',
                  onChanged: (value) {
                    _customerController.email = value;
                  },
                  errorText: _customerController.error.email,
                ),
              ),
            ),
            Observer(
              builder: (_) => Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFieldCreate(
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  icon: const Icon(
                    Icons.phone_iphone,
                    size: 26,
                  ),
                  hintText: 'Digite o número',
                  labelText: 'Telefone Celular',
                  onChanged: (value) {
                    _customerController.telcel = value;
                  },
                  errorText: _customerController.error.telcel,
                ),
              ),
            ),
            Observer(
              builder: (_) => Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextFieldCreate(
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  icon: const Icon(
                    Icons.phone,
                    size: 26,
                  ),
                  hintText: 'Digite o número',
                  labelText: 'Telefone Fixo',
                  onChanged: (value) {
                    _customerController.telfix = value;
                  },
                  errorText: _customerController.error.telfix,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(right: 14),
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
                        value: _customerController.roles,
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
                        items: _customerController.listRoles
                            .map<DropdownMenuItem<String>>(
                          (String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        onChanged: (String newValue) {
                          _customerController.roles = newValue;
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
