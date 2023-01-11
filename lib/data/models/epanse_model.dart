import 'dart:convert';

ExpenseModel? expenseModelFromJson(String str) =>
    ExpenseModel.fromJson(json.decode(str));

String expenseModelToJson(ExpenseModel? data) => json.encode(data!.toJson());

class ExpenseModel {
  ExpenseModel({
    this.name,
    this.date,
    this.amount,
    this.read,
    this.write,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.collection,
  });

  String? name;
  int? date;
  int? amount;
  List<dynamic>? read;
  List<dynamic>? write;
  String? id;
  int? createdAt;
  int? updatedAt;
  String? collection;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        name: json["name"],
        date: json["date"],
        amount: json["amount"],
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
        "name": name,
        "date": date,
        "amount": amount,
        "\u0024read":
            read == null ? [] : List<dynamic>.from(read!.map((x) => x)),
        "\u0024write":
            write == null ? [] : List<dynamic>.from(write!.map((x) => x)),
        "\u0024id": id,
        "\u0024createdAt": createdAt,
        "\u0024updatedAt": updatedAt,
        "\u0024collection": collection,
      };
}
