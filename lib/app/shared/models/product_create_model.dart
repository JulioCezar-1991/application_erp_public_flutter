class ProductCreateModel {
  dynamic id;
  dynamic title;
  dynamic description;
  dynamic type;
  dynamic price;
  dynamic averagetime;

  ProductCreateModel({
    this.id,
    this.title,
    this.description,
    this.type,
    this.price,
    this.averagetime,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['type'] = type;
    data['price'] = price;
    data['averagetime'] = averagetime;

    return data;
  }
}
