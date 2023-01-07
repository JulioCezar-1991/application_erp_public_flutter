class CustomerCreaterModel {
  dynamic roles;
  dynamic name;
  dynamic telcel;
  dynamic telfix;
  dynamic email;
  dynamic login;
  dynamic password;

  CustomerCreaterModel(
      {this.roles,
      this.name,
      this.telcel,
      this.telfix,
      this.email,
      this.login,
      this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roles'] = roles;
    data['name'] = name;
    data['telcel'] = telcel;
    data['telfix'] = telfix;
    data['email'] = email;
    data['login'] = login;
    data['password'] = password;
    return data;
  }
}
