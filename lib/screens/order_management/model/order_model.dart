import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.read,
    this.write,
    this.databaseId,
    this.name,
    this.enabled,
    this.permission,
    this.attributes,
    this.indexes,
  });

  String? id;
  int? createdAt;
  int? updatedAt;
  List<dynamic>? read;
  List<dynamic>? write;
  String? databaseId;
  String? name;
  bool? enabled;
  String? permission;
  List<Attribute>? attributes;
  List<dynamic>? indexes;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["\u0024id"],
        createdAt: json["\u0024createdAt"],
        updatedAt: json["\u0024updatedAt"],
        read: List<dynamic>.from(json["\u0024read"].map((x) => x)),
        write: List<dynamic>.from(json["\u0024write"].map((x) => x)),
        databaseId: json["databaseId"],
        name: json["name"],
        enabled: json["enabled"],
        permission: json["permission"],
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromJson(x))),
        indexes: List<dynamic>.from(json["indexes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "\u0024id": id,
        "\u0024createdAt": createdAt,
        "\u0024updatedAt": updatedAt,
        "\u0024read": List<dynamic>.from(read!.map((x) => x)),
        "\u0024write": List<dynamic>.from(write!.map((x) => x)),
        "databaseId": databaseId,
        "name": name,
        "enabled": enabled,
        "permission": permission,
        "attributes": List<dynamic>.from(attributes!.map((x) => x.toJson())),
        "indexes": List<dynamic>.from(indexes!.map((x) => x)),
      };
}

class Attribute {
  Attribute({
    this.key,
    this.type,
    this.status,
    this.required,
    this.array,
    this.size,
    this.attributeDefault,
    this.min,
    this.max,
  });

  String? key;
  String? type;
  String? status;
  bool? required;
  bool? array;
  int? size;
  dynamic attributeDefault;
  double? min;
  double? max;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        key: json["key"],
        type: json["type"],
        status: json["status"],
        required: json["required"],
        array: json["array"],
        size: json["size"] == null ? null : json["size"],
        attributeDefault: json["default"],
        min: json["min"] == null ? null : json["min"].toDouble(),
        max: json["max"] == null ? null : json["max"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "type": type,
        "status": status,
        "required": required,
        "array": array,
        "size": size == null ? null : size,
        "default": attributeDefault,
        "min": min == null ? null : min,
        "max": max == null ? null : max,
      };
}
