import 'package:application_erp_public_flutter/app/modules/product/product_controller.dart';
import 'package:application_erp_public_flutter/app/shared/components/text_field_update_widget.dart';
import 'package:application_erp_public_flutter/app/shared/models/product_list_model.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductListModel item;

  const ProductDetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final _productController = Modular.get<ProductController>();

  final format = DateFormat("HH:mm");

  @override
  Widget build(BuildContext context) {
    _productController.type = widget.item.type;
    _productController.averagetime = widget.item.averagetime;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detalhes do Produto",
          style: TextStyle(fontSize: 18),
        ),
        actions: <Widget>[
          // Icone de Atualização //
          Padding(
            padding: const EdgeInsets.only(right: 2),
            child: IconButton(
              icon: const Icon(
                Icons.update,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Confirmar Atualização do Produto"),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text(
                            "Confirmar",
                          ),
                          onPressed: () {
                            try {
                              _productController.patchProduct(widget.item.sId);
                              _productController.fetchProduct();
                              Modular.to.popAndPushNamed(
                                '/home',
                              );
                            } catch (e) {}
                          },
                        ),
                        FlatButton(
                          child: Text(
                            "Cancelar",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
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
            padding: const EdgeInsets.only(right: 2),
            child: IconButton(
              icon: const Icon(
                Icons.delete_outline,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Confirmar Exclusão do Produto"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            "Confirmar",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          onPressed: () {
                            try {
                              _productController.deleteProduct(widget.item.sId);
                              _productController.fetchProduct();
                              Modular.to.popAndPushNamed(
                                '/home',
                              );
                            } catch (e) {}
                          },
                        ),
                        FlatButton(
                          child: Text(
                            "Cancelar",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
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
        padding: const EdgeInsets.only(left: 20, bottom: 6, right: 20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Nome Produto",
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFieldUpdate(
                keyboardType: TextInputType.text,
                initialValue: widget.item.title,
                onChanged: (value) {
                  _productController.title = value;
                },
                errorText: _productController.error.title,
                maxLength: 38,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Preço",
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFieldUpdate(
                inputFormatters: [],
                maxLength: 6,
                keyboardType: TextInputType.text,
                initialValue: widget.item.price.toString(),
                onChanged: (value) {
                  _productController.price = value;
                },
                errorText: _productController.error.price,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Tempo Médio Gasto",
                ),
              ),
            ),
            DateTimeField(
              format: format,
              initialValue: DateTime.parse(_productController.averagetime),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.clear),
                ),
              ),
              onShowPicker: (context, currentValue) async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(
                    currentValue ?? DateTime.now(),
                  ),
                );
                if (currentValue != null) {
                  _productController.averagetime =
                      DateTimeField.convert(time).toString();
                }
                return DateTimeField.convert(time);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Tipo de Serviço",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
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
                  value: _productController.type,
                  isExpanded: true,
                  icon: Icon(
                    Icons.arrow_downward,
                    color: Theme.of(context).primaryColor,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  underline: Container(
                    height: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  items: _productController.listType
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (dynamic newValue) {
                    _productController.type = newValue;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Observação",
                ),
              ),
            ),
            Observer(
              builder: (_) => TextFieldUpdate(
                maxLines: 4,
                keyboardType: TextInputType.text,
                initialValue: widget.item.description,
                onChanged: (value) {
                  _productController.description = value;
                },
                errorText: _productController.error.description,
                maxLength: 112,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
