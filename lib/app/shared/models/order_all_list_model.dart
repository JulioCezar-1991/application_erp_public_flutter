class OrderAllListModel {
  dynamic status;
  dynamic sId;
  dynamic number;
  dynamic customer;
  dynamic client;
  dynamic schedulingdate;
  dynamic schedulinghour;
  dynamic itens;
  dynamic subtotal;
  dynamic createDate;

  OrderAllListModel(
      {this.status,
      this.sId,
      this.number,
      this.customer,
      this.client,
      this.schedulingdate,
      this.schedulinghour,
      this.itens,
      this.subtotal,
      this.createDate});

  OrderAllListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sId = json['_id'];
    number = json['number'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    client = json['client'] != null ? Customer.fromJson(json['client']) : null;
    schedulingdate = json['schedulingdate'];
    schedulinghour = json['schedulinghour'];
    if (json['itens'] != null) {
      itens = List<Itens>;
      json['itens'].forEach((v) {
        itens.add(Itens.fromJson(v));
      });
    }
    subtotal = json[subtotal];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['_id'] = sId;
    data['number'] = number;
    if (customer != null) {
      data['customer'] = customer.toJson();
    }
    if (client != null) {
      data['client'] = client.toJson();
    }
    data['schedulingdate'] = schedulingdate;
    data['schedulinghour'] = schedulinghour;
    if (itens != null) {
      data['itens'] = itens.map((v) => v.toJson()).toList();
    }
    data['subtotal'] = subtotal;
    data['createDate'] = createDate;
    return data;
  }
}

class Customer {
  dynamic sId;
  dynamic name;
  dynamic telcel;
  dynamic telfix;
  dynamic email;

  Customer({sId, name, telcel, telfix, email});

  Customer.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    telcel = json['telcel'];
    telfix = json['telfix'];
    email = json['email'];
  }

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
  dynamic product;

  Itens({this.product});

  Itens.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product.toJson();
    }
    return data;
  }
}

class Product {
  dynamic sId;
  dynamic title;
  dynamic price;
  dynamic averagetime;

  Product({this.sId, this.title, this.price, this.averagetime});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    price = double.parse(json['price'].toString());
    averagetime = json['averagetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['price'] = price;
    data['averagetime'] = averagetime;
    return data;
  }
}
