class CustomerModel {
  List<String> roles;
  bool active;
  String sId;
  String name;
  String telcel;
  String telfix;
  String email;
  String createDate;
  int iV;

  CustomerModel(
    this.roles,
    this.active,
    this.sId,
    this.name,
    this.telcel,
    this.telfix,
    this.email,
    this.createDate,
    this.iV,
  );

  CustomerModel.fromJson(Map<String, dynamic> json) {
    roles = json['roles'].cast<String>();
    active = json['active'];
    sId = json['_id'];
    name = json['name'];
    telcel = json['telcel'];
    telfix = json['telfix'];
    email = json['email'];
    createDate = json['createDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roles'] = roles;
    data['active'] = active;
    data['_id'] = sId;
    data['name'] = name;
    data['telcel'] = telcel;
    data['telfix'] = telfix;
    data['email'] = email;
    data['createDate'] = createDate;
    data['__v'] = iV;
    return data;
  }
}
