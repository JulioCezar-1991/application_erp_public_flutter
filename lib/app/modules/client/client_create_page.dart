import 'package:application_erp_public_flutter/app/modules/client/client_controller.dart';
import 'package:application_erp_public_flutter/app/shared/components/text_field_create_widget.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ClientCreatePage extends StatefulWidget {
  const ClientCreatePage({Key? key}) : super(key: key);

  @override
  State<ClientCreatePage> createState() => _ClientCreatePageState();
}

class _ClientCreatePageState extends State<ClientCreatePage> {
  @override
  Widget build(BuildContext context) {
    final clientController = Modular.get<ClientController>();

    final formKey = GlobalKey<FormState>();

    final format = DateFormat("dd/MM/yyyy");

    var maskCpfFormatter = MaskTextInputFormatter(
        mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});

    var maskTelFixFormatter = MaskTextInputFormatter(
        mask: "(##) ####-####", filter: {"#": RegExp(r'[0-9]')});

    var maskTelCelFormatter = MaskTextInputFormatter(
        mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cadastrar Novo Cliente",
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
                      title: const Text("Confirmar Cadastro do Cliente"),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text(
                            "Salvar",
                          ),
                          onPressed: () {
                            clientController.validateCreateAll();
                            clientController.fetchClient();
                            Modular.to.popAndPushNamed(
                              '/home',
                            );
                          },
                        ),
                        ElevatedButton(
                          child: const Text(
                            "Cancelar",
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
          children: <Widget>[
            Observer(
              builder: (_) => TextFieldCreate(
                keyboardType: TextInputType.text,
                maxLength: 38,
                icon: const Icon(
                  Icons.perm_identity,
                ),
                hintText: 'Digite o nome',
                labelText: 'Nome Completo',
                onChanged: (value) {
                  clientController.name = value;
                },
                errorText: clientController.error.name,
              ),
            ),
            Observer(
              builder: (_) => TextFieldCreate(
                inputFormatters: [maskCpfFormatter],
                keyboardType: TextInputType.number,
                maxLength: 11,
                icon: const Icon(
                  Icons.perm_identity,
                ),
                hintText: 'Digite seu CPF',
                labelText: 'CPF',
                onChanged: (value) {
                  clientController.cpf = value;
                },
                errorText: clientController.error.cpf,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            DateTimeField(
              key: formKey,
              initialValue: DateTime.now(),
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today),
                labelText: "Data de anivesário",
              ),
              format: format,
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
                if (date != null) {
                  clientController.date = date.toString();
                }
                return date;
              },
            ),
            Observer(
              builder: (_) => TextFieldCreate(
                keyboardType: TextInputType.emailAddress,
                maxLength: 32,
                icon: const Icon(
                  Icons.email,
                ),
                hintText: 'Digite o E-mail',
                labelText: 'E-mail',
                onChanged: (value) {
                  clientController.email = value;
                },
                errorText: clientController.error.email,
              ),
            ),
            Observer(
              builder: (_) => TextFieldCreate(
                inputFormatters: [maskTelCelFormatter],
                keyboardType: TextInputType.phone,
                maxLength: 12,
                icon: const Icon(
                  Icons.smartphone,
                ),
                hintText: 'Digite o número móvel',
                labelText: 'Telefone Celular',
                onChanged: (value) {
                  clientController.telcel = value;
                },
                errorText: clientController.error.telcel,
              ),
            ),
            Observer(
              builder: (_) => TextFieldCreate(
                inputFormatters: [maskTelFixFormatter],
                keyboardType: TextInputType.phone,
                maxLength: 12,
                icon: const Icon(
                  Icons.phone,
                ),
                hintText: 'Digite o telefone fixo',
                labelText: 'Telefone Fixo',
                onChanged: (value) {
                  clientController.telfix = value;
                },
                errorText: clientController.error.telfix,
              ),
            ),
            Observer(
              builder: (_) {
                return TextFieldCreate(
                  keyboardType: TextInputType.text,
                  maxLength: 38,
                  icon: const Icon(Icons.home),
                  hintText: 'Digite o endereço',
                  labelText: 'Endereço',
                  onChanged: (value) {
                    clientController.address = value;
                  },
                  errorText: clientController.error.address,
                );
              },
            ),
            Observer(
              builder: (_) {
                return TextFieldCreate(
                  keyboardType: TextInputType.text,
                  maxLength: 28,
                  icon: const Icon(FontAwesomeIcons.streetView),
                  hintText: 'Digite o bairro',
                  labelText: 'Bairro',
                  onChanged: (value) {
                    clientController.sector = value;
                  },
                  errorText: clientController.error.sector,
                );
              },
            ),
            Observer(
              builder: (_) {
                return TextFieldCreate(
                  keyboardType: TextInputType.text,
                  maxLength: 28,
                  icon: const Icon(
                    Icons.location_city,
                  ),
                  hintText: 'Digite a cidade',
                  labelText: 'Cidade',
                  onChanged: (value) {
                    clientController.city = value;
                  },
                  errorText: clientController.error.city,
                );
              },
            ),
            Observer(
              builder: (_) {
                return TextFieldCreate(
                  icon: const Icon(
                    FontAwesomeIcons.mapLocationDot,
                  ),
                  hintText: 'Digite o estado',
                  labelText: 'Estado',
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    clientController.state = value;
                  },
                  errorText: clientController.error.state,
                );
              },
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
