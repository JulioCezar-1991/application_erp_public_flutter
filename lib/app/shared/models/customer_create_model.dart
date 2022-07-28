class CustomerCreaterModel {
  List<String> roles;
  String name;
  String telcel;
  String telfix;
  String email;
  String login;
  String password;

  CustomerCreaterModel(
    this.roles,
    this.name,
    this.telcel,
    this.telfix,
    this.email,
    this.login,
    this.password,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
