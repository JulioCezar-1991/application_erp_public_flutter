class ClientCreateModel {
  String id;
  String name;
  String cpf;
  String date;
  String telcel;
  String telfix;
  String email;
  String address;
  String sector;
  String city;
  String state;

  ClientCreateModel(
      this.id,
      this.name,
      this.cpf,
      this.date,
      this.telcel,
      this.telfix,
      this.email,
      this.address,
      this.sector,
      this.city,
      this.state);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = id;
    data['name'] = name;
    data['cpf'] = cpf;
    data['date'] = date;
    data['telcel'] = telcel;
    data['telfix'] = telfix;
    data['email'] = email;
    data['address'] = address;
    data['sector'] = sector;
    data['city'] = city;
    data['state'] = state;
    return data;
  }
}
