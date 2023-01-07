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

  ClientCreateModel({
    required this.id,
    required this.name,
    required this.cpf,
    required this.date,
    required this.telcel,
    required this.telfix,
    required this.email,
    required this.address,
    required this.sector,
    required this.city,
    required this.state,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
