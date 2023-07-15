import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  String vendorName;
  int date;
  int productId;
  int productAmount;
  List<dynamic> productIds;
  List<dynamic> productQuantity;
  List<dynamic> read;
  List<dynamic> write;
  String id;
  int createdAt;
  int updatedAt;
  String collection;

  OrderModel({
    required this.vendorName,
    required this.date,
    required this.productId,
    required this.productAmount,
    required this.productIds,
    required this.productQuantity,
    required this.read,
    required this.write,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.collection,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        vendorName: json["vendorName"],
        date: json["date"],
        productId: json["productID"],
        productAmount: json["productAmount"],
        productIds: List<dynamic>.from(json["productIds"].map((x) => x)),
        productQuantity:
            List<dynamic>.from(json["productQuantity"].map((x) => x)),
        read: json["\u0024read"] == null
            ? []
            : List<dynamic>.from(json["\u0024read"]!.map((x) => x)),
        write: json["\u0024write"] == null
            ? []
            : List<dynamic>.from(json["\u0024write"]!.map((x) => x)),
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
        "productIds": List<dynamic>.from(productIds.map((x) => x)),
        "productQuantity": List<dynamic>.from(productQuantity.map((x) => x)),
        "\u0024read": List<dynamic>.from(read.map((x) => x)),
        "\u0024write": List<dynamic>.from(write.map((x) => x)),
        "\u0024id": id,
        "\u0024createdAt": createdAt,
        "\u0024updatedAt": updatedAt,
        "\u0024collection": collection,
      };
}
