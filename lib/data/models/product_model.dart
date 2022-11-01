class ProductModel {
  ProductModel({
    this.id,
    this.company,
    this.name,
    this.type,
    this.price,
    this.image,
    this.description,
  });

  int? id;
  String? company;
  String? name;
  String? type;
  String? price;
  String? image;
  String? description;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        company: json["company"],
        name: json["name"],
        type: json["type"],
        price: json["price"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "company": company,
        "name": name,
        "type": type,
        "price": price,
        "image": image,
        "description": description,
      };
}
