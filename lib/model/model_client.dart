class Client {
  String? name, phone;
  int? id;

  Client({this.id, this.name, this.phone});

  Map<String, dynamic> toMap() => {"id": id, "name": name, "phone": phone};

  factory Client.fromMap(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );
}
