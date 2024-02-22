// To parse this JSON data, do
//
//     final getAddonsModel = getAddonsModelFromJson(jsonString);

import 'dart:convert';

GetAddonsModel getAddonsModelFromJson(String str) => GetAddonsModel.fromJson(json.decode(str));

String getAddonsModelToJson(GetAddonsModel data) => json.encode(data.toJson());

class GetAddonsModel {
    final bool? status;
    final GetAddonsData? data;

    GetAddonsModel({
        this.status,
        this.data,
    });

    factory GetAddonsModel.fromJson(Map<String, dynamic> json) => GetAddonsModel(
        status: json["status"],
        data: json["data"] == null ? null : GetAddonsData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class GetAddonsData {
    final int? currentPage;
    final List<GetAddonsDatum>? data;
    final String? firstPageUrl;
    final int? from;
    final int? lastPage;
    final String? lastPageUrl;
    final List<GetAddonsLink>? links;
    final String? nextPageUrl;
    final String? path;
    final int? perPage;
    final dynamic prevPageUrl;
    final int? to;
    final int? total;

    GetAddonsData({
        this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total,
    });

    factory GetAddonsData.fromJson(Map<String, dynamic> json) => GetAddonsData(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<GetAddonsDatum>.from(json["data"]!.map((x) => GetAddonsDatum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null ? [] : List<GetAddonsLink>.from(json["links"]!.map((x) => GetAddonsLink.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
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

class GetAddonsLink {
    final String? url;
    final String? label;
    final bool? active;

    GetAddonsLink({
        this.url,
        this.label,
        this.active,
    });

    factory GetAddonsLink.fromJson(Map<String, dynamic> json) => GetAddonsLink(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
