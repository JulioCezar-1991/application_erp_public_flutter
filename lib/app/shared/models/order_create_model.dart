class OrderCreateModel {
  dynamic id;
  dynamic customer;
  dynamic client;
  dynamic schedulingdate;
  dynamic subtotal;
  dynamic status;
  dynamic formPayment;
  dynamic items;

  OrderCreateModel(
      {this.id,
      this.customer,
      this.client,
      this.schedulingdate,
      this.subtotal,
      this.status,
      this.formPayment,
      this.items});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer'] = customer;
    data['client'] = client;
    data['schedulingdate'] = schedulingdate;
    data['subtotal'] = subtotal;
    data['status'] = status;
    data['formPayment'] = formPayment;
    data['items'] = items;
    return data;
  }
}
