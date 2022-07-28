class ClientModel {
  dynamic active;
  dynamic sId;
  dynamic name;
  dynamic cpf;
  dynamic date;
  dynamic telcel;
  dynamic telfix;
  dynamic email;
  dynamic address;
  dynamic sector;
  dynamic city;
  dynamic createDate;
  dynamic iV;

  ClientModel(
      {this.active,
      this.sId,
      this.name,
      this.cpf,
      this.date,
      this.telcel,
      this.telfix,
      this.email,
      this.address,
      this.sector,
      this.city,
      this.createDate,
      this.iV});

  ClientModel.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    sId = json['_id'];
    name = json['name'];
    cpf = json['cpf'];
    date = json['date'];
    telcel = json['telcel'];
    telfix = json['telfix'];
    email = json['email'];
    address = json['address'];
    sector = json['sector'];
    city = json['city'];
    createDate = json['createDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['active'] = active;
    data['_id'] = sId;
    data['name'] = name;
    data['cpf'] = cpf;
    data['date'] = date;
    data['telcel'] = telcel;
    data['telfix'] = telfix;
    data['email'] = email;
    data['address'] = address;
    data['sector'] = sector;
    data['city'] = city;
    data['createDate'] = createDate;
    data['__v'] = iV;
    return data;
  }
}
