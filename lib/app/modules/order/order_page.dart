import 'package:application_erp_public_flutter/app/modules/order/order_controller.dart';
import 'package:application_erp_public_flutter/app/shared/components/order_canceled_card_widget.dart';
import 'package:application_erp_public_flutter/app/shared/components/order_done_card_widget.dart';
import 'package:application_erp_public_flutter/app/shared/components/order_open_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderController = Modular.get<OrderController>();
    return Scaffold(
      appBar: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 2,
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Theme.of(context).backgroundColor,
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 4.0,
            ),
          ),
        ),
        tabs: const [
          Tab(
            icon: Icon(Icons.add_shopping_cart),
            text: "Abertos",
          ),
          Tab(
            icon: Icon(Icons.shopping_cart),
            text: "Fechados",
          ),
          Tab(
            icon: Icon(Icons.remove_shopping_cart),
            text: "Cancelados",
          ),
        ],
        controller: _tabController,
      ),
      body: TabBarView(
        children: <Widget>[
          //Order Abertas
          Center(
            child: Observer(
              builder: (_) {
                if (orderController.ordersOpen.error != null) {
                  return Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.replay,
                        size: 40,
                      ),
                      onPressed: () {
                        orderController.fetchOrderOpen();
                      },
                    ),
                  );
                }
                if (orderController.ordersOpen.value == null) {
                  return Center(child: CircularProgressIndicator());
                }
                var list = orderController.ordersOpen.value;
                return ListView.builder(
                  itemCount: list?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: OrderOpenCard(
                        item: list![index],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          //Order Fechadas
          Center(
            child: Observer(
              builder: (_) {
                if (orderController.ordersDone.error != null) {
                  return Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.replay,
                        size: 40,
                      ),
                      onPressed: () {
                        orderController.fetchOrderDone();
                      },
                    ),
                  );
                }
                if (orderController.ordersDone.value == null) {
                  return Center(child: CircularProgressIndicator());
                }
                var list = orderController.ordersDone.value;
                return ListView.builder(
                  itemCount: list?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: OrderDoneCard(
                        item: list![index],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          //Order Canceladas
          Center(
            child: Observer(
              builder: (_) {
                if (orderController.ordersCanceled.error != null) {
                  return Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.replay,
                        size: 40,
                      ),
                      onPressed: () {
                        orderController.fetchOrderCanceled();
                      },
                    ),
                  );
                }
                if (orderController.ordersCanceled.value == null) {
                  return Center(child: CircularProgressIndicator());
                }
                var list = orderController.ordersCanceled.value;
                return ListView.builder(
                  itemCount: list?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: OrderCanceledCard(
                        item: list![index],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
        controller: _tabController,
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
