import 'package:application_erp_public_flutter/app/modules/product/product_details_page.dart';
import 'package:application_erp_public_flutter/app/shared/models/product_list_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCard extends StatelessWidget {
  final ProductListModel item;

  const ProductCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isExpanded = false;
    const _defaultLines = 2;

    return GestureDetector(
      child: Card(
        elevation: 2,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 90,
              height: 100,
              child: Center(
                child: Icon(FontAwesomeIcons.cut,
                    color: Colors.pinkAccent[100], size: 60),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height / 3.1,
              height: 110,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 4),
                    child: Text(
                      item.title.length > 22
                          ? item.title.substring(0, 22) + '...'
                          : item.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Valor Serviço: R\$ ${item.price.toString()}",
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.5, bottom: 6),
                    child: Text(
                      'Tempo Médio Gasto: ${item.averagetime.substring(10, 16)}h',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      /* produto.nome == null ? "" : "Shopp ${produto.desc}", */
                      item.description = item.description =
                          item.description.length > 64
                              ? item.description.substring(0, 58) + '...'
                              : item.description,
                      maxLines: _isExpanded ? null : _defaultLines,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
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
            builder: (context) => ProductDetailsPage(
              item: item,
            ),
          ),
        );
      },
    );
  }
}
