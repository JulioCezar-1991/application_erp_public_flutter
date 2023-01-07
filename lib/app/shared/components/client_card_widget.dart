import 'package:application_erp_public_flutter/app/modules/client/client_details_page.dart';
import 'package:application_erp_public_flutter/app/modules/client/client_list_model.dart';
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
            const Expanded(
              flex: 1,
              child: Center(
                heightFactor: 1.5,
                widthFactor: 1,
                child: Icon(
                  Icons.person,
                  color: Colors.teal,
                  size: 60,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height / 3.2,
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 4),
                    child: Text(
                      item.name.isNotEmpty
                          ? (item.name.length >= 32
                              ? '${item.name.substring(0, 29)}...'
                              : item.name)
                          : 'Consumidor Final',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        item.sector.isNotEmpty
                            ? (item.sector.length >= 18
                                ? '${item.sector.substring(0, 16)}...'
                                : item.sector)
                            : 'Sem Setor',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(
                        child: Text(" - "),
                      ),
                      Text(
                        item.city.isNotEmpty
                            ? (item.city.length >= 12
                                ? '${item.city.substring(0, 11)}...'
                                : item.city)
                            : 'Sem Setor',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.5, bottom: 4),
                    child: Row(
                      children: <Widget>[
                        Text(
                          item.telcel ?? 'Sem Celular',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(
                          width: 22,
                        ),
                        Text(
                          item.telfix ?? 'Sem Fone Fixo',
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor),
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
