class OrderModel {
  dynamic id;
  dynamic formPayment;
  dynamic status;
  dynamic customer;
  dynamic client;
  dynamic schedulingdate;
  dynamic itens;
  dynamic subtotal;

  OrderModel(
      {this.id,
      this.formPayment,
      this.status,
      this.customer,
      this.client,
      this.schedulingdate,
      this.itens,
      this.subtotal});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    formPayment = json['formPayment'];
    status = json['status'];
    customer = json['customer'];
    client = json['client'];
    schedulingdate = json['schedulingdate'];
    if (json['itens'] != null) {
      itens = List<Itens>;
      json['itens'].forEach((v) {
        itens.add(Itens.fromJson(v));
      });
    }
    subtotal = json['subtotal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['formPayment'] = formPayment;
    data['status'] = status;
    data['customer'] = customer;
    data['client'] = client;
    data['schedulingdate'] = schedulingdate;
    if (itens != null) {
      data['itens'] = itens.map((v) => v.toJson()).toList();
    }
    data['subtotal'] = subtotal;
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
