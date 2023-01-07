class OrderOpenListModel {
  String status;
  String sId;
  String number;
  String schedulingdate;
  dynamic customer;
  dynamic client;

  dynamic itens;
  double? subtotal;
  String? createDate;

  OrderOpenListModel(
      this.status,
      this.sId,
      this.number,
      this.customer,
      this.client,
      this.schedulingdate,
      this.itens,
      this.subtotal,
      this.createDate);

  OrderOpenListModel.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        sId = json['_id'],
        number = json['number'],
        customer = json['customer'] != null
            ? Customer.fromJson(json['customer'])
            : null,
        client =
            json['client'] != null ? Customer.fromJson(json['client']) : null,
        schedulingdate = json['schedulingdate'],

        /* if (json['itens'] != null) {
      itens = List<Itens>;
      json['itens'].forEach((v) {
        itens.add(Itens.fromJson(v));
      });
    } */
        subtotal = json['subtotal'],
        createDate = json['createDate'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['_id'] = sId;
    data['number'] = number;
    if (customer != null) {
      data['customer'] = customer;
    }
    if (client != null) {
      data['client'] = client;
    }
    data['schedulingdate'] = schedulingdate;
    if (itens != null) {
      data['itens'] = itens.map((v) => v.toJson()).toList();
    }
    data['subtotal'] = subtotal;
    data['createDate'] = createDate;
    return data;
  }
}

class Customer {
  String sId;
  String name;
  String telcel;
  String telfix;
  String email;

  Customer(this.sId, this.name, this.telcel, this.telfix, this.email);

  Customer.fromJson(Map<String, dynamic> json)
      : sId = json['_id'],
        name = json['name'],
        telcel = json['telcel'],
        telfix = json['telfix'],
        email = json['email'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['telcel'] = telcel;
    data['telfix'] = telfix;
    data['email'] = email;
    return data;
  }
}

class Itens {
  Product product;

  Itens(this.product);

  Itens.fromJson(Map<String, dynamic> json)
      : product = json['product'] ?? Product.fromJson(json['product']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product;
    }
    return data;
  }
}

class Product {
  String sId;
  String title;
  double price;
  String averagetime;

  Product(this.sId, this.title, this.price, this.averagetime);

  Product.fromJson(Map<String, dynamic> json)
      : sId = json['_id'],
        title = json['title'],
        price = double.parse(json['price'].toString()),
        averagetime = json['averagetime'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['price'] = price;
    data['averagetime'] = averagetime;
    return data;
  }
}
