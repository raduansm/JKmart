// To parse this JSON data, do
//
//     final paymentTypeModel = paymentTypeModelFromJson(jsonString);

import 'dart:convert';

PaymentTypeModel paymentTypeModelFromJson(String str) => PaymentTypeModel.fromJson(json.decode(str));

String paymentTypeModelToJson(PaymentTypeModel data) => json.encode(data.toJson());

class PaymentTypeModel {
  PaymentTypeModel({
    this.name,
    this.details,
    this.read,
    this.write,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.collection,
  });

  final String? name;
  final dynamic details;
  final List<dynamic>? read;
  final List<dynamic>? write;
  final String? id;
  final int? createdAt;
  final int? updatedAt;
  final String? collection;

  factory PaymentTypeModel.fromJson(Map<String, dynamic> json) => PaymentTypeModel(
        name: json["name"],
        details: json["details"],
        read: json["\u0024read"] == null ? [] : List<dynamic>.from(json["\u0024read"]!.map((x) => x)),
        write: json["\u0024write"] == null ? [] : List<dynamic>.from(json["\u0024write"]!.map((x) => x)),
        id: json["\u0024id"],
        createdAt: json["\u0024createdAt"],
        updatedAt: json["\u0024updatedAt"],
        collection: json["\u0024collection"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "details": details,
        "\u0024read": read == null ? [] : List<dynamic>.from(read!.map((x) => x)),
        "\u0024write": write == null ? [] : List<dynamic>.from(write!.map((x) => x)),
        "\u0024id": id,
        "\u0024createdAt": createdAt,
        "\u0024updatedAt": updatedAt,
        "\u0024collection": collection,
      };
}
