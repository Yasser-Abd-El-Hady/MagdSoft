class AccountModel {
  AccountModel({
    this.id,
    this.name,
    this.phone,
  });

  int? id;
  String? name;
  String? phone;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
      };
}
