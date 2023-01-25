// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.password,
    this.hash,
    this.hashOptions,
    this.registration,
    this.status,
    this.passwordUpdate,
    this.email,
    this.phone,
    this.emailVerification,
    this.phoneVerification,
    this.prefs,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? password;
  String? hash;
  HashOptions? hashOptions;
  DateTime? registration;
  bool? status;
  DateTime? passwordUpdate;
  String? email;
  String? phone;
  bool? emailVerification;
  bool? phoneVerification;
  Prefs? prefs;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["\u0024id"],
        createdAt: json["\u0024createdAt"] == null ? null : DateTime.parse(json["\u0024createdAt"]),
        updatedAt: json["\u0024updatedAt"] == null ? null : DateTime.parse(json["\u0024updatedAt"]),
        name: json["name"],
        password: json["password"],
        hash: json["hash"],
        hashOptions: json["hashOptions"] == null ? null : HashOptions.fromJson(json["hashOptions"]),
        registration: json["registration"] == null ? null : DateTime.parse(json["registration"]),
        status: json["status"],
        passwordUpdate: json["passwordUpdate"] == null ? null : DateTime.parse(json["passwordUpdate"]),
        email: json["email"],
        phone: json["phone"],
        emailVerification: json["emailVerification"],
        phoneVerification: json["phoneVerification"],
        prefs: json["prefs"] == null ? null : Prefs.fromJson(json["prefs"]),
      );

  Map<String, dynamic> toJson() => {
        "\u0024id": id,
        "\u0024createdAt": createdAt?.toIso8601String(),
        "\u0024updatedAt": updatedAt?.toIso8601String(),
        "name": name,
        "password": password,
        "hash": hash,
        "hashOptions": hashOptions?.toJson(),
        "registration": registration?.toIso8601String(),
        "status": status,
        "passwordUpdate": passwordUpdate?.toIso8601String(),
        "email": email,
        "phone": phone,
        "emailVerification": emailVerification,
        "phoneVerification": phoneVerification,
        "prefs": prefs?.toJson(),
      };
}

class HashOptions {
  HashOptions({
    this.type,
    this.memoryCost,
    this.timeCost,
    this.threads,
  });

  String? type;
  int? memoryCost;
  int? timeCost;
  int? threads;

  factory HashOptions.fromJson(Map<String, dynamic> json) => HashOptions(
        type: json["type"],
        memoryCost: json["memoryCost"],
        timeCost: json["timeCost"],
        threads: json["threads"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "memoryCost": memoryCost,
        "timeCost": timeCost,
        "threads": threads,
      };
}

class Prefs {
  Prefs({
    this.role,
  });

  String? role;

  factory Prefs.fromJson(Map<String, dynamic> json) => Prefs(
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "role": role,
      };
}
