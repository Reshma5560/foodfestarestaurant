// To parse this JSON data, do
//
//     final currentOrderStatusModel = currentOrderStatusModelFromJson(jsonString);

import 'dart:convert';

CurrentOrderStatusModel currentOrderStatusModelFromJson(String str) =>
    CurrentOrderStatusModel.fromJson(json.decode(str));

String currentOrderStatusModelToJson(CurrentOrderStatusModel data) =>
    json.encode(data.toJson());

class CurrentOrderStatusModel {
  final bool? status;
  final List<CurrentOrderStatusDatum>? data;

  CurrentOrderStatusModel({
    this.status,
    this.data,
  });

  factory CurrentOrderStatusModel.fromJson(Map<String, dynamic> json) =>
      CurrentOrderStatusModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<CurrentOrderStatusDatum>.from(
                json["data"]!.map((x) => CurrentOrderStatusDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CurrentOrderStatusDatum {
  final String? id;
  final String? status;
  final String? statusName;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CurrentOrderStatusDatum({
    this.id,
    this.status,
    this.statusName,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory CurrentOrderStatusDatum.fromJson(Map<String, dynamic> json) =>
      CurrentOrderStatusDatum(
        id: json["id"],
        status: json["status"],
        statusName: json["status_name"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "status_name": statusName,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
