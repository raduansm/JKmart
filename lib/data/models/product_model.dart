import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String name;
  String barcode;
  String category;
  int needed;
  int have;
  String vendorId;
  List<dynamic> read;
  List<dynamic> write;
  String id;
  int createdAt;
  int updatedAt;
  String collection;

  ProductModel({
    required this.name,
    required this.barcode,
    required this.category,
    required this.needed,
    required this.have,
    required this.vendorId,
    required this.read,
    required this.write,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.collection,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        name: json["name"],
        barcode: json["barcode"],
        category: json["category"],
        needed: json["needed"],
        have: json["have"],
        vendorId: json["vendorID"],
        read: List<dynamic>.from(json["\u0024read"].map((x) => x)),
        write: List<dynamic>.from(json["\u0024write"].map((x) => x)),
        id: json["\u0024id"],
        createdAt: json["\u0024createdAt"],
        updatedAt: json["\u0024updatedAt"],
        collection: json["\u0024collection"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "barcode": barcode,
        "category": category,
        "needed": needed,
        "have": have,
        "vendorID": vendorId,
        "\u0024read": List<dynamic>.from(read.map((x) => x)),
        "\u0024write": List<dynamic>.from(write.map((x) => x)),
        "\u0024id": id,
        "\u0024createdAt": createdAt,
        "\u0024updatedAt": updatedAt,
        "\u0024collection": collection,
      };
}
