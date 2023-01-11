import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.vendorName,
    this.date,
    this.productId,
    this.productAmount,
    this.read,
    this.write,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.collection,
  });

  String? vendorName;
  int? date;
  int? productId;
  int? productAmount;
  List<dynamic>? read;
  List<dynamic>? write;
  String? id;
  int? createdAt;
  int? updatedAt;
  String? collection;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        vendorName: json["vendorName"],
        date: json["date"],
        productId: json["productID"],
        productAmount: json["productAmount"],
        read: List<dynamic>.from(json["\u0024read"].map((x) => x)),
        write: List<dynamic>.from(json["\u0024write"].map((x) => x)),
        id: json["\u0024id"],
        createdAt: json["\u0024createdAt"],
        updatedAt: json["\u0024updatedAt"],
        collection: json["\u0024collection"],
      );

  Map<String, dynamic> toJson() => {
        "vendorName": vendorName,
        "date": date,
        "productID": productId,
        "productAmount": productAmount,
        "\u0024read": List<dynamic>.from(read!.map((x) => x)),
        "\u0024write": List<dynamic>.from(write!.map((x) => x)),
        "\u0024id": id,
        "\u0024createdAt": createdAt,
        "\u0024updatedAt": updatedAt,
        "\u0024collection": collection,
      };
}
