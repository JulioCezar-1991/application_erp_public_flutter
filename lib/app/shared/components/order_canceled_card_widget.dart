import 'package:application_erp_public_flutter/app/modules/order/order_canceled_details_page.dart';
import 'package:application_erp_public_flutter/app/shared/models/order_canceled_list_model.dart';
import 'package:flutter/material.dart';

class OrderCanceledCard extends StatelessWidget {
  final OrderCanceledListModel item;

  const OrderCanceledCard({Key? key, required this.item}) : super(key: key);

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
                  Icons.shopping_cart,
                  color: Colors.red,
                  size: 50,
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
                    padding: const EdgeInsets.only(top: 5, bottom: 0),
                    child: Text(
                      item.client.name != null
                          ? (item.client.name.length >= 32
                              ? item.client.name.substring(0, 29) + '...'
                              : item.client.name)
                          : 'Consumidor Final',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 2),
                    child: Text(
                      "Agendamento: ${item.schedulingdate.substring(8, 10)}/${item.schedulingdate.substring(5, 7)}/${item.schedulingdate.substring(0, 4)} - ${item.schedulingdate.substring(11, 13)}:${item.schedulingdate.substring(14, 16)}",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 3.5, bottom: 4),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Registro: ${item.createDate.substring(8, 10)}/${item.createDate.substring(5, 7)}/${item.createDate.substring(0, 4)}-${item.createDate.substring(11, 13)}:${item.createDate.substring(14, 16)}",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).accentColor),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              item.status,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),
                    ],
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
            builder: (context) => OrderCanceledDetailsPage(
              item: item,
            ),
          ),
        );
      },
    );
  }
}
