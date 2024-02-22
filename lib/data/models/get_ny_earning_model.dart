// To parse this JSON data, do
//
//     final getMyEarningModel = getMyEarningModelFromJson(jsonString);

import 'dart:convert';

GetMyEarningModel getMyEarningModelFromJson(String str) =>
    GetMyEarningModel.fromJson(json.decode(str));

String getMyEarningModelToJson(GetMyEarningModel data) =>
    json.encode(data.toJson());

class GetMyEarningModel {
  final bool? status;
  final List<MyEarningDatum>? data;
  final Wallet? wallet;

  GetMyEarningModel({
    this.status,
    this.data,
    this.wallet,
  });

  factory GetMyEarningModel.fromJson(Map<String, dynamic> json) =>
      GetMyEarningModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<MyEarningDatum>.from(
                json["data"]!.map((x) => MyEarningDatum.fromJson(x))),
        wallet: json["wallet"] == null ? null : Wallet.fromJson(json["wallet"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "wallet": wallet?.toJson(),
      };
}

class MyEarningDatum {
  final String? id;
  final dynamic disbursementId;
  final String? restaurantId;
  final dynamic deliveryManId;
  final double? disbursementAmount;
  final dynamic paymentMethod;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic paymentType;

  MyEarningDatum({
    this.id,
    this.disbursementId,
    this.restaurantId,
    this.deliveryManId,
    this.disbursementAmount,
    this.paymentMethod,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.paymentType,
  });

  factory MyEarningDatum.fromJson(Map<String, dynamic> json) => MyEarningDatum(
        id: json["id"],
        disbursementId: json["disbursement_id"],
        restaurantId: json["restaurant_id"],
        deliveryManId: json["delivery_man_id"],
        disbursementAmount: json["disbursement_amount"]?.toDouble(),
        paymentMethod: json["payment_method"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        paymentType: json["payment_type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "disbursement_id": disbursementId,
        "restaurant_id": restaurantId,
        "delivery_man_id": deliveryManId,
        "disbursement_amount": disbursementAmount,
        "payment_method": paymentMethod,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "payment_type": paymentType,
      };
}

class Wallet {
  final String? id;
  final String? vendorId;
  final String? totalEarning;
  final String? totalWithdrawn;
  final String? pendingWithdraw;
  final dynamic collectedCash;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Wallet({
    this.id,
    this.vendorId,
    this.totalEarning,
    this.totalWithdrawn,
    this.pendingWithdraw,
    this.collectedCash,
    this.createdAt,
    this.updatedAt,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["id"],
        vendorId: json["vendor_id"],
        totalEarning: json["total_earning"],
        totalWithdrawn: json["total_withdrawn"],
        pendingWithdraw: json["pending_withdraw"],
        collectedCash: json["collected_cash"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_id": vendorId,
        "total_earning": totalEarning,
        "total_withdrawn": totalWithdrawn,
        "pending_withdraw": pendingWithdraw,
        "collected_cash": collectedCash,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
