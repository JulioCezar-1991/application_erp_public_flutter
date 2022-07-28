import 'package:application_erp_public_flutter/app/modules/client/client_details_page.dart';
import 'package:application_erp_public_flutter/app/shared/models/client_list_model.dart';
import 'package:flutter/material.dart';

class ClientCard extends StatelessWidget {
  final ClientListModel item;

  const ClientCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 2,
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 80,
              height: 80,
              child: Center(
                child: Icon(
                  Icons.person,
                  color: Colors.teal,
                  size: 60,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height / 3.0,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 4),
                    child: Text(
                      item.name != null
                          ? (item.name.length >= 32
                              ? item.name.substring(0, 29) + '...'
                              : item.name)
                          : 'Consumidor Final',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        item.sector != null
                            ? (item.sector.length >= 18
                                ? item.sector.substring(0, 16) + '...'
                                : item.sector)
                            : 'Sem Setor',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      const SizedBox(
                        child: Text(" - "),
                      ),
                      Text(
                        item.city != null
                            ? (item.city.length >= 12
                                ? item.city.substring(0, 11) + '...'
                                : item.city)
                            : 'Sem Setor',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.5, bottom: 4),
                    child: Row(
                      children: <Widget>[
                        Text(
                          item.telcel == null ? 'Sem Celular' : item.telcel,
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).accentColor),
                        ),
                        SizedBox(
                          width: 22,
                        ),
                        Text(
                          item.telfix == null ? 'Sem Fone Fixo' : item.telfix,
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).accentColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClientDetailsPage(
              item: item,
              key: key,
            ),
          ),
        );
      },
    );
  }
}
