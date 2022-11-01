import '../../models/product_model.dart';

class ProductResponseModel {
  ProductResponseModel({
    this.status,
    this.message,
    this.products,
  });

  int? status;
  String? message;
  List<ProductModel>? products;

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) =>
      ProductResponseModel(
        status: json["status"],
        message: json["message"],
        products: List<ProductModel>.from(
            json["products"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "products": List<ProductModel>.from(products!.map((x) => x.toJson())),
      };
}
