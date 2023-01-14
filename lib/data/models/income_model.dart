import 'dart:convert';

IncomeModel? incomeModelFromJson(String str) =>
    IncomeModel.fromJson(json.decode(str));

String incomeModelToJson(IncomeModel? data) => json.encode(data!.toJson());

class IncomeModel {
  IncomeModel({
    this.vendor,
    this.date,
    this.amount,
    this.type,
    this.read,
    this.write,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.collection,
  });

  String? vendor;
  String? date;
  String? amount;
  String? type;
  List<String?>? read;
  List<String?>? write;
  String? id;
  int? createdAt;
  int? updatedAt;
  String? collection;

  factory IncomeModel.fromJson(Map<String, dynamic> json) => IncomeModel(
        vendor: json["vendor"],
        date: json["date"],
        amount: json["amount"],
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
        "vendor": vendor,
        "date": date,
        "amount": amount,
        "type": type,
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
