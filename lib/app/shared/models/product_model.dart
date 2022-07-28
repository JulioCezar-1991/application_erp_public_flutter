class ProductModel {
  dynamic active;
  dynamic sId;
  dynamic title;
  dynamic description;
  dynamic type;
  dynamic price;
  dynamic averagetime;
  dynamic createDate;
  dynamic iV;

  ProductModel(
    this.active,
    this.sId,
    this.title,
    this.description,
    this.type,
    this.price,
    this.averagetime,
    this.createDate,
    this.iV,
  );

  ProductModel.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    price = double.parse(json['price'].toString());
    averagetime = json['averagetime'];
    createDate = json['createDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['active'] = active;
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['type'] = type;
    data['price'] = price;
    data['averagetime'] = averagetime;
    data['createDate'] = createDate;
    data['__v'] = iV;
    return data;
  }
}
