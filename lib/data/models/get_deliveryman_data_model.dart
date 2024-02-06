// To parse this JSON data, do
//
//      getDeliveryManDataModel = getDeliveryManDataModelFromJson(jsonString);

import 'dart:convert';

GetDeliveryManDataModel getDeliveryManDataModelFromJson(String str) =>
    GetDeliveryManDataModel.fromJson(json.decode(str));

String getDeliveryManDataModelToJson(GetDeliveryManDataModel data) =>
    json.encode(data.toJson());

class GetDeliveryManDataModel {
   bool? status;
   List<GetDeliveryManDatum>? data;

  GetDeliveryManDataModel({
    this.status,
    this.data,
  });

  factory GetDeliveryManDataModel.fromJson(Map<String, dynamic> json) =>
      GetDeliveryManDataModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<GetDeliveryManDatum>.from(
                json["data"]!.map((x) => GetDeliveryManDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GetDeliveryManDatum {
   String? id;
   String? userId;
   String? identityNumber;
   String? identityType;
   String? identityImage;
   dynamic image;
   int? earning;
   String? zoneId;
   int? orderCount;
   int? assignedOrderCount;
   int? available;
   String? vehicleId;
   String? shiftId;
   int? currentOrders;
   dynamic additionalData;
   dynamic additionalDocuments;
   String? applicationStatus;
   String? type;
   dynamic restaurantId;
   String? paymentType;
   String? paymentAmount;
   int? isActive;
   dynamic createdBy;
   dynamic updatedBy;
   dynamic deletedAt;
   DateTime? createdAt;
   DateTime? updatedAt;
   int? ordersCount;
   List<DeliveryManOrders>? orders;
   User? user;

  GetDeliveryManDatum({
    this.id,
    this.userId,
    this.identityNumber,
    this.identityType,
    this.identityImage,
    this.image,
    this.earning,
    this.zoneId,
    this.orderCount,
    this.assignedOrderCount,
    this.available,
    this.vehicleId,
    this.shiftId,
    this.currentOrders,
    this.additionalData,
    this.additionalDocuments,
    this.applicationStatus,
    this.type,
    this.restaurantId,
    this.paymentType,
    this.paymentAmount,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.ordersCount,
    this.orders,
    this.user,
  });

  factory GetDeliveryManDatum.fromJson(Map<String, dynamic> json) =>
      GetDeliveryManDatum(
        id: json["id"],
        userId: json["user_id"],
        identityNumber: json["identity_number"],
        identityType: json["identity_type"],
        identityImage: json["identity_image"],
        image: json["image"],
        earning: json["earning"],
        zoneId: json["zone_id"],
        orderCount: json["order_count"],
        assignedOrderCount: json["assigned_order_count"],
        available: json["available"],
        vehicleId: json["vehicle_id"],
        shiftId: json["shift_id"],
        currentOrders: json["current_orders"],
        additionalData: json["additional_data"],
        additionalDocuments: json["additional_documents"],
        applicationStatus: json["application_status"],
        type: json["type"],
        restaurantId: json["restaurant_id"],
        paymentType: json["payment_type"],
        paymentAmount: json["payment_amount"],
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
        ordersCount: json["orders_count"],
        orders: json["orders"] == null
            ? []
            : List<DeliveryManOrders>.from(
                json["orders"]!.map((x) => DeliveryManOrders.fromJson(x))),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "identity_number": identityNumber,
        "identity_type": identityType,
        "identity_image": identityImage,
        "image": image,
        "earning": earning,
        "zone_id": zoneId,
        "order_count": orderCount,
        "assigned_order_count": assignedOrderCount,
        "available": available,
        "vehicle_id": vehicleId,
        "shift_id": shiftId,
        "current_orders": currentOrders,
        "additional_data": additionalData,
        "additional_documents": additionalDocuments,
        "application_status": applicationStatus,
        "type": type,
        "restaurant_id": restaurantId,
        "payment_type": paymentType,
        "payment_amount": paymentAmount,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "orders_count": ordersCount,
        "orders": orders == null
            ? []
            : List<dynamic>.from(orders!.map((x) => x.toJson())),
        "user": user?.toJson(),
      };
}

class DeliveryManOrders {
   String? id;
   String? invoiceNumber;
   String? userId;
   String? orderStatusId;
   String? paymentStatusId;
   String? paymentTypeId;
   int? orderAmount;
   String? totalDiscount;
   int? totalTaxAmount;
   int? deliveryCharge;
   int? restaurantDiscountAmount;
   int? originalDeliveryCharge;
   dynamic transactionReference;
   String? deliveryAddressId;
   String? deliveryManId;
   dynamic deliveryManRemarks;
   dynamic customerComplaint;
   dynamic couponCode;
   dynamic orderNote;
   dynamic deliveryDate;
   String? orderType;
   int? checked;
   String? restaurantId;
   String? adjustment;
   String? discountTotal;
   int? edited;
   dynamic otp;
   dynamic pending;
   dynamic accepted;
   dynamic confirmed;
   dynamic processing;
   dynamic handover;
   dynamic pickedUp;
   dynamic delivered;
   dynamic canceled;
   dynamic refundRequested;
   dynamic refunded;
   dynamic failed;
   dynamic cancellationNote;
   dynamic cancellationReason;
   dynamic canceledBy;
   dynamic refundRequestCanceled;
   dynamic taxPercentage;
   dynamic deliveryInstruction;
   dynamic unavailableItemNote;
   bool? cutlery;
   int? distance;
   bool? isGuest;
   dynamic deliveryAddress;
   dynamic zoneId;
   int? dmTips;
   dynamic taxStatus;
   dynamic vehicleId;
   dynamic scheduleAt;
   int? scheduled;
   dynamic processingTime;
   dynamic callback;
   int? additionalCharge;
   int? partiallyPaidAmount;
   dynamic orderProof;
   dynamic couponCreatedBy;
   dynamic freeDeliveryBy;
   int? orderSubscriptionActive;
   int? isActive;
   String? createdBy;
   dynamic updatedBy;
   dynamic deletedAt;
   DateTime? createdAt;
   DateTime? updatedAt;
   String? discountOnProductBy;
   dynamic subscriptionId;

  DeliveryManOrders({
    this.id,
    this.invoiceNumber,
    this.userId,
    this.orderStatusId,
    this.paymentStatusId,
    this.paymentTypeId,
    this.orderAmount,
    this.totalDiscount,
    this.totalTaxAmount,
    this.deliveryCharge,
    this.restaurantDiscountAmount,
    this.originalDeliveryCharge,
    this.transactionReference,
    this.deliveryAddressId,
    this.deliveryManId,
    this.deliveryManRemarks,
    this.customerComplaint,
    this.couponCode,
    this.orderNote,
    this.deliveryDate,
    this.orderType,
    this.checked,
    this.restaurantId,
    this.adjustment,
    this.discountTotal,
    this.edited,
    this.otp,
    this.pending,
    this.accepted,
    this.confirmed,
    this.processing,
    this.handover,
    this.pickedUp,
    this.delivered,
    this.canceled,
    this.refundRequested,
    this.refunded,
    this.failed,
    this.cancellationNote,
    this.cancellationReason,
    this.canceledBy,
    this.refundRequestCanceled,
    this.taxPercentage,
    this.deliveryInstruction,
    this.unavailableItemNote,
    this.cutlery,
    this.distance,
    this.isGuest,
    this.deliveryAddress,
    this.zoneId,
    this.dmTips,
    this.taxStatus,
    this.vehicleId,
    this.scheduleAt,
    this.scheduled,
    this.processingTime,
    this.callback,
    this.additionalCharge,
    this.partiallyPaidAmount,
    this.orderProof,
    this.couponCreatedBy,
    this.freeDeliveryBy,
    this.orderSubscriptionActive,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.discountOnProductBy,
    this.subscriptionId,
  });

  factory DeliveryManOrders.fromJson(Map<String, dynamic> json) =>
      DeliveryManOrders(
        id: json["id"],
        invoiceNumber: json["invoice_number"],
        userId: json["user_id"],
        orderStatusId: json["order_status_id"],
        paymentStatusId: json["payment_status_id"],
        paymentTypeId: json["payment_type_id"],
        orderAmount: json["order_amount"],
        totalDiscount: json["total_discount"],
        totalTaxAmount: json["total_tax_amount"],
        deliveryCharge: json["delivery_charge"],
        restaurantDiscountAmount: json["restaurant_discount_amount"],
        originalDeliveryCharge: json["original_delivery_charge"],
        transactionReference: json["transaction_reference"],
        deliveryAddressId: json["delivery_address_id"],
        deliveryManId: json["delivery_man_id"],
        deliveryManRemarks: json["delivery_man_remarks"],
        customerComplaint: json["customer_complaint"],
        couponCode: json["coupon_code"],
        orderNote: json["order_note"],
        deliveryDate: json["delivery_date"],
        orderType: json["order_type"],
        checked: json["checked"],
        restaurantId: json["restaurant_id"],
        adjustment: json["adjustment"],
        discountTotal: json["discount_total"],
        edited: json["edited"],
        otp: json["otp"],
        pending: json["pending"],
        accepted: json["accepted"],
        confirmed: json["confirmed"],
        processing: json["processing"],
        handover: json["handover"],
        pickedUp: json["picked_up"],
        delivered: json["delivered"],
        canceled: json["canceled"],
        refundRequested: json["refund_requested"],
        refunded: json["refunded"],
        failed: json["failed"],
        cancellationNote: json["cancellation_note"],
        cancellationReason: json["cancellation_reason"],
        canceledBy: json["canceled_by"],
        refundRequestCanceled: json["refund_request_canceled"],
        taxPercentage: json["tax_percentage"],
        deliveryInstruction: json["delivery_instruction"],
        unavailableItemNote: json["unavailable_item_note"],
        cutlery: json["cutlery"],
        distance: json["distance"],
        isGuest: json["is_guest"],
        deliveryAddress: json["delivery_address"],
        zoneId: json["zone_id"],
        dmTips: json["dm_tips"],
        taxStatus: json["tax_status"],
        vehicleId: json["vehicle_id"],
        scheduleAt: json["schedule_at"],
        scheduled: json["scheduled"],
        processingTime: json["processing_time"],
        callback: json["callback"],
        additionalCharge: json["additional_charge"],
        partiallyPaidAmount: json["partially_paid_amount"],
        orderProof: json["order_proof"],
        couponCreatedBy: json["coupon_created_by"],
        freeDeliveryBy: json["free_delivery_by"],
        orderSubscriptionActive: json["order_subscription_active"],
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
        discountOnProductBy: json["discount_on_product_by"],
        subscriptionId: json["subscription_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "invoice_number": invoiceNumber,
        "user_id": userId,
        "order_status_id": orderStatusId,
        "payment_status_id": paymentStatusId,
        "payment_type_id": paymentTypeId,
        "order_amount": orderAmount,
        "total_discount": totalDiscount,
        "total_tax_amount": totalTaxAmount,
        "delivery_charge": deliveryCharge,
        "restaurant_discount_amount": restaurantDiscountAmount,
        "original_delivery_charge": originalDeliveryCharge,
        "transaction_reference": transactionReference,
        "delivery_address_id": deliveryAddressId,
        "delivery_man_id": deliveryManId,
        "delivery_man_remarks": deliveryManRemarks,
        "customer_complaint": customerComplaint,
        "coupon_code": couponCode,
        "order_note": orderNote,
        "delivery_date": deliveryDate,
        "order_type": orderType,
        "checked": checked,
        "restaurant_id": restaurantId,
        "adjustment": adjustment,
        "discount_total": discountTotal,
        "edited": edited,
        "otp": otp,
        "pending": pending,
        "accepted": accepted,
        "confirmed": confirmed,
        "processing": processing,
        "handover": handover,
        "picked_up": pickedUp,
        "delivered": delivered,
        "canceled": canceled,
        "refund_requested": refundRequested,
        "refunded": refunded,
        "failed": failed,
        "cancellation_note": cancellationNote,
        "cancellation_reason": cancellationReason,
        "canceled_by": canceledBy,
        "refund_request_canceled": refundRequestCanceled,
        "tax_percentage": taxPercentage,
        "delivery_instruction": deliveryInstruction,
        "unavailable_item_note": unavailableItemNote,
        "cutlery": cutlery,
        "distance": distance,
        "is_guest": isGuest,
        "delivery_address": deliveryAddress,
        "zone_id": zoneId,
        "dm_tips": dmTips,
        "tax_status": taxStatus,
        "vehicle_id": vehicleId,
        "schedule_at": scheduleAt,
        "scheduled": scheduled,
        "processing_time": processingTime,
        "callback": callback,
        "additional_charge": additionalCharge,
        "partially_paid_amount": partiallyPaidAmount,
        "order_proof": orderProof,
        "coupon_created_by": couponCreatedBy,
        "free_delivery_by": freeDeliveryBy,
        "order_subscription_active": orderSubscriptionActive,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "discount_on_product_by": discountOnProductBy,
        "subscription_id": subscriptionId,
      };
}

class User {
   String? id;
   String? firstName;
   String? lastName;
   String? phone;
   String? email;
   dynamic image;
   int? isPhoneVerified;
   dynamic emailVerifiedAt;
   dynamic emailVerificationToken;
   dynamic cmFirebaseToken;
   int? isActive;
   int? newsletterSubscribe;
   int? isVerified;
   dynamic verifyCode;
   dynamic deletedAt;
   DateTime? createdAt;
   DateTime? updatedAt;
   int? status;
   int? orderCount;
   dynamic loginMedium;
   dynamic socialId;
   dynamic zoneId;
   int? walletBalance;
   int? loyaltyPoint;
   dynamic refCode;
   dynamic refBy;
   dynamic tempToken;
   String? currentLanguageKey;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.image,
    this.isPhoneVerified,
    this.emailVerifiedAt,
    this.emailVerificationToken,
    this.cmFirebaseToken,
    this.isActive,
    this.newsletterSubscribe,
    this.isVerified,
    this.verifyCode,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.orderCount,
    this.loginMedium,
    this.socialId,
    this.zoneId,
    this.walletBalance,
    this.loyaltyPoint,
    this.refCode,
    this.refBy,
    this.tempToken,
    this.currentLanguageKey,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        image: json["image"],
        isPhoneVerified: json["is_phone_verified"],
        emailVerifiedAt: json["email_verified_at"],
        emailVerificationToken: json["email_verification_token"],
        cmFirebaseToken: json["cm_firebase_token"],
        isActive: json["is_active"],
        newsletterSubscribe: json["newsletter_subscribe"],
        isVerified: json["is_verified"],
        verifyCode: json["verify_code"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        status: json["status"],
        orderCount: json["order_count"],
        loginMedium: json["login_medium"],
        socialId: json["social_id"],
        zoneId: json["zone_id"],
        walletBalance: json["wallet_balance"],
        loyaltyPoint: json["loyalty_point"],
        refCode: json["ref_code"],
        refBy: json["ref_by"],
        tempToken: json["temp_token"],
        currentLanguageKey: json["current_language_key"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "image": image,
        "is_phone_verified": isPhoneVerified,
        "email_verified_at": emailVerifiedAt,
        "email_verification_token": emailVerificationToken,
        "cm_firebase_token": cmFirebaseToken,
        "is_active": isActive,
        "newsletter_subscribe": newsletterSubscribe,
        "is_verified": isVerified,
        "verify_code": verifyCode,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
        "order_count": orderCount,
        "login_medium": loginMedium,
        "social_id": socialId,
        "zone_id": zoneId,
        "wallet_balance": walletBalance,
        "loyalty_point": loyaltyPoint,
        "ref_code": refCode,
        "ref_by": refBy,
        "temp_token": tempToken,
        "current_language_key": currentLanguageKey,
      };
}
