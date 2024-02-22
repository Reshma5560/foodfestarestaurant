// To parse this JSON data, do
//
//     final getSubCategoryModel = getSubCategoryModelFromJson(jsonString);

import 'dart:convert';

GetSubCategoryModel getSubCategoryModelFromJson(String str) =>
    GetSubCategoryModel.fromJson(json.decode(str));

String getSubCategoryModelToJson(GetSubCategoryModel data) =>
    json.encode(data.toJson());

class GetSubCategoryModel {
  final bool? status;
  final List<GetSubCategoryDatum>? data;

  GetSubCategoryModel({
    this.status,
    this.data,
  });

  factory GetSubCategoryModel.fromJson(Map<String, dynamic> json) =>
      GetSubCategoryModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<GetSubCategoryDatum>.from(
                json["data"]!.map((x) => GetSubCategoryDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GetSubCategoryDatum {
  final String? id;
  final String? categoryName;
  final String? image;
  final String? slug;
  final String? parentId;
  final int? position;
  final int? isActive;
  final String? createdBy;
  final String? updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? priority;
  final String? parentname;
  final List<dynamic>? translations;
  final Parent? parent;

  GetSubCategoryDatum({
    this.id,
    this.categoryName,
    this.image,
    this.slug,
    this.parentId,
    this.position,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.priority,
    this.parentname,
    this.translations,
    this.parent,
  });

  factory GetSubCategoryDatum.fromJson(Map<String, dynamic> json) =>
      GetSubCategoryDatum(
        id: json["id"],
        categoryName: json["category_name"],
        image: json["image"],
        slug: json["slug"],
        parentId: json["parent_id"],
        position: json["position"],
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
        priority: json["priority"],
        parentname: json["parentname"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        parent: json["parent"] == null ? null : Parent.fromJson(json["parent"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "image": image,
        "slug": slug,
        "parent_id": parentId,
        "position": position,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "priority": priority,
        "parentname": parentname,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "parent": parent?.toJson(),
      };
}

class Parent {
  final String? id;
  final String? categoryName;
  final String? image;
  final String? slug;
  final dynamic parentId;
  final int? position;
  final int? isActive;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? priority;
  final String? parentname;
  final List<dynamic>? translations;
  final dynamic parent;

  Parent({
    this.id,
    this.categoryName,
    this.image,
    this.slug,
    this.parentId,
    this.position,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.priority,
    this.parentname,
    this.translations,
    this.parent,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        id: json["id"],
        categoryName: json["category_name"],
        image: json["image"],
        slug: json["slug"],
        parentId: json["parent_id"],
        position: json["position"],
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
        priority: json["priority"],
        parentname: json["parentname"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
        parent: json["parent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "image": image,
        "slug": slug,
        "parent_id": parentId,
        "position": position,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "priority": priority,
        "parentname": parentname,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "parent": parent,
      };
}
