import 'dart:convert';

ExpenseModel expenseModelFromJson(String str) =>
    ExpenseModel.fromJson(json.decode(str));

String expenseModelToJson(ExpenseModel data) => json.encode(data.toJson());

class ExpenseModel {
  ExpenseModel({
    this.date,
    this.amount,
    this.vendor,
    this.expenseDetails,
    this.type,
    this.read,
    this.write,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.collection,
  });

  String? date;
  String? amount;
  String? vendor;
  String? expenseDetails;
  String? type;
  List<String?>? read;
  List<String?>? write;
  String? id;
  int? createdAt;
  int? updatedAt;
  String? collection;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        date: json["date"],
        amount: json["amount"],
        vendor: json["vendor"],
        expenseDetails: json["expenseDetails"],
        type: json["type"],
        read: json["\u0024read"] == null
            ? []
            : List<String?>.from(json["\u0024read"]!.map((x) => x)),
        write: json["\u0024write"] == null
            ? []
            : List<String?>.from(json["\u0024write"]!.map((x) => x)),
        id: json["\u0024id"],
        createdAt: json["\u0024createdAt"],
        updatedAt: json["\u0024updatedAt"],
        collection: json["\u0024collection"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "amount": amount,
        "vendor": vendor,
        "expenseDetails": expenseDetails,
        "type": type,
        "\u0024read": List<dynamic>.from(read!.map((x) => x)),
        "\u0024write": List<dynamic>.from(write!.map((x) => x)),
        "\u0024id": id,
        "\u0024createdAt": createdAt,
        "\u0024updatedAt": updatedAt,
        "\u0024collection": collection,
      };
}
