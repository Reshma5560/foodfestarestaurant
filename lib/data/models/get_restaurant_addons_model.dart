// To parse this JSON data, do
//
//     final getRestaurantAddonsModel = getRestaurantAddonsModelFromJson(jsonString);

import 'dart:convert';

GetRestaurantAddonsModel getRestaurantAddonsModelFromJson(String str) =>
    GetRestaurantAddonsModel.fromJson(json.decode(str));

String getRestaurantAddonsModelToJson(GetRestaurantAddonsModel data) =>
    json.encode(data.toJson());

class GetRestaurantAddonsModel {
  final bool? status;
  final List<GetRestaurantAddonsDatum>? data;

  GetRestaurantAddonsModel({
    this.status,
    this.data,
  });

  factory GetRestaurantAddonsModel.fromJson(Map<String, dynamic> json) =>
      GetRestaurantAddonsModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<GetRestaurantAddonsDatum>.from(
                json["data"]!.map((x) => GetRestaurantAddonsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GetRestaurantAddonsDatum {
  final String? id;
  final String? addonName;
  final int? price;
  final String? restaurantId;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  bool isTrueValue;

  GetRestaurantAddonsDatum(
      {this.id,
      this.addonName,
      this.price,
      this.restaurantId,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.isTrueValue = false});

  factory GetRestaurantAddonsDatum.fromJson(Map<String, dynamic> json) =>
      GetRestaurantAddonsDatum(
        id: json["id"],
        addonName: json["addon_name"],
        price: json["price"],
        restaurantId: json["restaurant_id"],
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
        "addon_name": addonName,
        "price": price,
        "restaurant_id": restaurantId,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
