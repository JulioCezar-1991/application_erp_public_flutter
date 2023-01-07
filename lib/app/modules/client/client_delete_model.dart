class ClientDeleteModel {
  final String id;

  ClientDeleteModel({required this.id});

  ClientDeleteModel.fromJson(Map<String, dynamic> json) : id = json['id'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};

  return data;
}
