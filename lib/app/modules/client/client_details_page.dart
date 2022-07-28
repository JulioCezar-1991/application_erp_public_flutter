import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:projeto_fanap/app/modules/client/client_controller.dart';
import 'package:projeto_fanap/app/shared/components/text_field_update_widget.dart';
import 'package:projeto_fanap/app/shared/models/client_list_model.dart';

class ClientDetailsPage extends StatefulWidget {
  final ClientListModel item;

  const ClientDetailsPage({Key key, this.item});

  @override
  _ClientDetailsPageState createState() => _ClientDetailsPageState();
}

class _ClientDetailsPageState extends State<ClientDetailsPage> {
  final _clientController = Modular.get<ClientController>();
  final formKey = GlobalKey<FormState>();
  final format = DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    var maskTelFixFormatter = MaskTextInputFormatter(
        mask: "(##) ####-####", filter: {"#": RegExp(r'[0-9]')});

    var maskTelCelFormatter = MaskTextInputFormatter(
        mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});

    var maskCpfFormatter = MaskTextInputFormatter(
        mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});

    _clientController.date = widget.item.date;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detalhes do Cliente",
          style: TextStyle(fontSize: 18),
        ),
        actions: <Widget>[
          // Icone de Atualização //
          Padding(
            padding: EdgeInsets.only(right: 2),
            child: IconButton(
              icon: Icon(
                Icons.update,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Confirmar Atualização do Cliente"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            "Confirmar",
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                          onPressed: () {
                            try {
                              _clientController.patchClient(widget.item.sId);
                              _clientController.fetchClient();
                              Modular.to.popAndPushNamed(
                                '/home',
                              );
                            } catch (e) {}
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
          // Icone de Delete //
          Padding(
            padding: EdgeInsets.only(right: 2),
            child: IconButton(
              icon: Icon(
                Icons.delete_outline,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Confirmar Exclusão do Cliente"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            "Confirmar",
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                          onPressed: () {
                            try {
                              _clientController.deleteClient(widget.item.sId);
                              _clientController.fetchClient();
                              Modular.to.popAndPushNamed(
                                '/home',
                              );
                            } catch (e) {}
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
        padding: EdgeInsets.only(left: 20, bottom: 6, right: 20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nome Completo",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFieldUpdate(
                keyboardType: TextInputType.text,
                initialValue: widget.item.name,
                onChanged: (value) {
                  _clientController.name = value;
                },
                errorText: _clientController.error.name,
                maxLength: 38,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "CPF",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFieldUpdate(
                inputFormatters: [maskCpfFormatter],
                keyboardType: TextInputType.number,
                initialValue: widget.item.cpf,
                onChanged: (value) {
                  _clientController.cpf = value;
                },
                errorText: _clientController.error.cpf,
                maxLength: 11,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Data de anivesário",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
            // Data de Aniversario
            Container(
              child: DateTimeField(
                key: formKey,
                initialValue: DateTime.parse(_clientController.date),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  border: OutlineInputBorder(),
                ),
                format: format,
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                  if (date != null) {
                    _clientController.date = date.toString();
                    print(_clientController.date);
                  }
                  return date;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "E-mail",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFieldUpdate(
                keyboardType: TextInputType.text,
                initialValue: widget.item.email,
                onChanged: (value) {
                  _clientController.email = value;
                },
                errorText: _clientController.error.email,
                maxLength: 32,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Telefone Celular",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFieldUpdate(
                inputFormatters: [maskTelCelFormatter],
                keyboardType: TextInputType.number,
                initialValue: widget.item.telcel,
                onChanged: (value) {
                  _clientController.telcel = value;
                },
                errorText: _clientController.error.telcel,
                maxLength: 12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Telefone fixo",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFieldUpdate(
                inputFormatters: [maskTelFixFormatter],
                keyboardType: TextInputType.number,
                initialValue: widget.item.telfix,
                onChanged: (value) {
                  _clientController.telfix = value;
                },
                errorText: _clientController.error.telfix,
                maxLength: 12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Endereço",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFieldUpdate(
                keyboardType: TextInputType.text,
                initialValue: widget.item.address,
                onChanged: (value) {
                  _clientController.address = value;
                },
                errorText: _clientController.error.address,
                maxLength: 38,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Bairro",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFieldUpdate(
                keyboardType: TextInputType.text,
                initialValue: widget.item.sector,
                onChanged: (value) {
                  _clientController.sector = value;
                },
                errorText: _clientController.error.sector,
                maxLength: 38,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Cidade",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFieldUpdate(
                keyboardType: TextInputType.text,
                initialValue: widget.item.city,
                onChanged: (value) {
                  _clientController.city = value;
                },
                errorText: _clientController.error.city,
                maxLength: 48,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Estado",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFieldUpdate(
                maxLength: 24,
                keyboardType: TextInputType.text,
                initialValue: widget.item.state,
                onChanged: (value) {
                  _clientController.state = value;
                },
                errorText: _clientController.error.state,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
