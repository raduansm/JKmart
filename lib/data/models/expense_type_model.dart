import 'dart:convert';

ExpenseTypeModel expenseTypeModelFromJson(String str) =>
    ExpenseTypeModel.fromJson(json.decode(str));

String expenseTypeModelToJson(ExpenseTypeModel data) =>
    json.encode(data.toJson());

class ExpenseTypeModel {
  ExpenseTypeModel({
    this.name,
    this.details,
    this.read,
    this.write,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.collection,
  });

  String? name;
  final dynamic details;
  final List<dynamic>? read;
  final List<dynamic>? write;
  String? id;
  int? createdAt;
  int? updatedAt;
  String? collection;

  factory ExpenseTypeModel.fromJson(Map<String, dynamic> json) =>
      ExpenseTypeModel(
        name: json["name"],
        details: json["details"],
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
        "name": name,
        "details": details,
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
