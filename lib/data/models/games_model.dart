// To parse this JSON data, do
//
//     final gamesModel = gamesModelFromJson(jsonString);

import 'dart:convert';

GamesModel? gamesModelFromJson(String str) => GamesModel.fromJson(json.decode(str));

String gamesModelToJson(GamesModel? data) => json.encode(data!.toJson());

class GamesModel {
  GamesModel({
    this.gameId,
    this.name,
    this.vloume,
    this.read,
    this.write,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.collection,
  });

  int? gameId;
  String? name;
  int? vloume;
  List<dynamic>? read;
  List<dynamic>? write;
  String? id;
  int? createdAt;
  int? updatedAt;
  String? collection;

  factory GamesModel.fromJson(Map<String, dynamic> json) => GamesModel(
        gameId: json["gameId"],
        name: json["name"],
        vloume: json["vloume"],
        read: json["\u0024read"] == null ? [] : List<dynamic>.from(json["\u0024read"]!.map((x) => x)),
        write: json["\u0024write"] == null ? [] : List<dynamic>.from(json["\u0024write"]!.map((x) => x)),
        id: json["\u0024id"],
        createdAt: json["\u0024createdAt"],
        updatedAt: json["\u0024updatedAt"],
        collection: json["\u0024collection"],
      );

  Map<String, dynamic> toJson() => {
        "gameId": gameId,
        "name": name,
        "vloume": vloume,
        "\u0024read": read == null ? [] : List<dynamic>.from(read!.map((x) => x)),
        "\u0024write": write == null ? [] : List<dynamic>.from(write!.map((x) => x)),
        "\u0024id": id,
        "\u0024createdAt": createdAt,
        "\u0024updatedAt": updatedAt,
        "\u0024collection": collection,
      };
}
