import 'dart:convert';

LotteryModel lotteryModelFromJson(String str) => LotteryModel.fromJson(json.decode(str));

String lotteryModelToJson(LotteryModel data) => json.encode(data.toJson());

class LotteryModel {
  LotteryModel({
    this.serial,
    this.start,
    this.close,
    this.total,
    this.read,
    this.write,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.collection,
    this.gameId,
    this.date,
  });

  String? serial;
  String? start;
  String? close;
  String? total;
  List<dynamic>? read;
  List<dynamic>? write;
  String? id;
  int? createdAt;
  int? updatedAt;
  String? collection;
  String? date;
  int? gameId;

  factory LotteryModel.fromJson(Map<String, dynamic> json) => LotteryModel(
        serial: json["serial"],
        start: json["start"],
        close: json["close"],
        total: json["total"],
        read: List<dynamic>.from(json["\u0024read"].map((x) => x)),
        write: List<dynamic>.from(json["\u0024write"].map((x) => x)),
        id: json["\u0024id"],
        createdAt: json["\u0024createdAt"],
        updatedAt: json["\u0024updatedAt"],
        collection: json["\u0024collection"],
        gameId: json["gameId"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "serial": serial,
        "start": start,
        "close": close,
        "total": total,
        "\u0024read": List<dynamic>.from(read!.map((x) => x)),
        "\u0024write": List<dynamic>.from(write!.map((x) => x)),
        "\u0024id": id,
        "\u0024createdAt": createdAt,
        "\u0024updatedAt": updatedAt,
        "\u0024collection": collection,
        "date": date,
        "gameId": gameId,
      };
}

class Permissions {
  Permissions({
    this.read,
    this.write,
  });

  List<dynamic>? read;
  List<dynamic>? write;

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
        read: List<dynamic>.from(json["\u0024read"].map((x) => x)),
        write: List<dynamic>.from(json["\u0024write"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "\u0024read": List<dynamic>.from(read!.map((x) => x)),
        "\u0024write": List<dynamic>.from(write!.map((x) => x)),
      };
}
