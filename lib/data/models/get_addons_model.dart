// To parse this JSON data, do
//
//     final getAddonsModel = getAddonsModelFromJson(jsonString);

import 'dart:convert';

GetAddonsModel getAddonsModelFromJson(String str) => GetAddonsModel.fromJson(json.decode(str));

String getAddonsModelToJson(GetAddonsModel data) => json.encode(data.toJson());

class GetAddonsModel {
    final bool? status;
    final List<GetAddonsDatum>? data;

    GetAddonsModel({
        this.status,
        this.data,
    });

    factory GetAddonsModel.fromJson(Map<String, dynamic> json) => GetAddonsModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<GetAddonsDatum>.from(json["data"]!.map((x) => GetAddonsDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class GetAddonsDatum {
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

    GetAddonsDatum({
        this.id,
        this.addonName,
        this.price,
        this.restaurantId,
        this.isActive,
        this.createdBy,
        this.updatedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    factory GetAddonsDatum.fromJson(Map<String, dynamic> json) => GetAddonsDatum(
        id: json["id"],
        addonName: json["addon_name"],
        price: json["price"],
        restaurantId: json["restaurant_id"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
