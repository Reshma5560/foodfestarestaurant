// To parse this JSON data, do
//
//     final getOrderHistoryFilterModel = getOrderHistoryFilterModelFromJson(jsonString);

import 'dart:convert';

GetOrderHistoryFilterModel getOrderHistoryFilterModelFromJson(String str) => GetOrderHistoryFilterModel.fromJson(json.decode(str));

String getOrderHistoryFilterModelToJson(GetOrderHistoryFilterModel data) => json.encode(data.toJson());

class GetOrderHistoryFilterModel {
    final bool? status;
    final GetOrderHistoryFilterData? data;

    GetOrderHistoryFilterModel({
        this.status,
        this.data,
    });

    factory GetOrderHistoryFilterModel.fromJson(Map<String, dynamic> json) => GetOrderHistoryFilterModel(
        status: json["status"],
        data: json["data"] == null ? null : GetOrderHistoryFilterData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
    };
}

class GetOrderHistoryFilterData {
    final int? currentPage;
    final List<GetOrderHistoryFilterDatum>? data;
    final String? firstPageUrl;
    final int? from;
    final int? lastPage;
    final String? lastPageUrl;
    final List<Link>? links;
    final dynamic nextPageUrl;
    final String? path;
    final int? perPage;
    final dynamic prevPageUrl;
    final int? to;
    final int? total;

    GetOrderHistoryFilterData({
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

    factory GetOrderHistoryFilterData.fromJson(Map<String, dynamic> json) => GetOrderHistoryFilterData(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<GetOrderHistoryFilterDatum>.from(json["data"]!.map((x) => GetOrderHistoryFilterDatum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
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

class GetOrderHistoryFilterDatum {
    final String? id;
    final String? invoiceNumber;
    final String? userId;
    final String? orderStatusId;
    final String? paymentStatusId;
    final String? paymentTypeId;
    final int? orderAmount;
    final String? totalDiscount;
    final int? totalTaxAmount;
    final int? deliveryCharge;
    final int? restaurantDiscountAmount;
    final int? originalDeliveryCharge;
    final dynamic transactionReference;
    final String? deliveryAddressId;
    final String? deliveryManId;
    final dynamic deliveryManRemarks;
    final dynamic customerComplaint;
    final dynamic couponCode;
    final String? orderNote;
    final dynamic deliveryDate;
    final String? orderType;
    final int? checked;
    final String? restaurantId;
    final String? adjustment;
    final String? discountTotal;
    final int? edited;
    final dynamic otp;
    final dynamic pending;
    final dynamic accepted;
    final dynamic confirmed;
    final dynamic processing;
    final dynamic handover;
    final dynamic pickedUp;
    final dynamic delivered;
    final dynamic canceled;
    final dynamic refundRequested;
    final dynamic refunded;
    final dynamic failed;
    final dynamic cancellationNote;
    final dynamic cancellationReason;
    final dynamic canceledBy;
    final dynamic refundRequestCanceled;
    final dynamic taxPercentage;
    final dynamic deliveryInstruction;
    final dynamic unavailableItemNote;
    final bool? cutlery;
    final int? distance;
    final bool? isGuest;
    final dynamic deliveryAddress;
    final dynamic zoneId;
    final int? dmTips;
    final dynamic taxStatus;
    final dynamic vehicleId;
    final dynamic scheduleAt;
    final int? scheduled;
    final dynamic processingTime;
    final dynamic callback;
    final int? additionalCharge;
    final int? partiallyPaidAmount;
    final dynamic orderProof;
    final dynamic couponCreatedBy;
    final dynamic freeDeliveryBy;
    final int? orderSubscriptionActive;
    final int? isActive;
    final String? createdBy;
    final dynamic updatedBy;
    final dynamic deletedAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? discountOnProductBy;
    final dynamic subscriptionId;
    final User? user;
    final Restaurant? restaurant;
    final Status? orderStatus;
    final Status? paymentStatus;
    final PaymentType? paymentType;

    GetOrderHistoryFilterDatum({
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
        this.user,
        this.restaurant,
        this.orderStatus,
        this.paymentStatus,
        this.paymentType,
    });

    factory GetOrderHistoryFilterDatum.fromJson(Map<String, dynamic> json) => GetOrderHistoryFilterDatum(
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        discountOnProductBy: json["discount_on_product_by"],
        subscriptionId: json["subscription_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        restaurant: json["restaurant"] == null ? null : Restaurant.fromJson(json["restaurant"]),
        orderStatus: json["order_status"] == null ? null : Status.fromJson(json["order_status"]),
        paymentStatus: json["payment_status"] == null ? null : Status.fromJson(json["payment_status"]),
        paymentType: json["payment_type"] == null ? null : PaymentType.fromJson(json["payment_type"]),
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
        "user": user?.toJson(),
        "restaurant": restaurant?.toJson(),
        "order_status": orderStatus?.toJson(),
        "payment_status": paymentStatus?.toJson(),
        "payment_type": paymentType?.toJson(),
    };
}

class Status {
    final String? id;
    final String? status;
    final String? statusName;
    final int? isActive;
    final dynamic createdBy;
    final dynamic updatedBy;
    final dynamic deletedAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Status({
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

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        status: json["status"],
        statusName: json["status_name"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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

class PaymentType {
    final String? id;
    final String? paymentTypeName;
    final String? description;
    final String? value;
    final dynamic providerKey;
    final dynamic providerSecret;
    final int? isActive;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    PaymentType({
        this.id,
        this.paymentTypeName,
        this.description,
        this.value,
        this.providerKey,
        this.providerSecret,
        this.isActive,
        this.createdAt,
        this.updatedAt,
    });

    factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
        id: json["id"],
        paymentTypeName: json["payment_type_name"],
        description: json["description"],
        value: json["value"],
        providerKey: json["provider_key"],
        providerSecret: json["provider_secret"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "payment_type_name": paymentTypeName,
        "description": description,
        "value": value,
        "provider_key": providerKey,
        "provider_secret": providerSecret,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Restaurant {
    final String? id;
    final String? restaurantName;
    final String? phone;
    final String? email;
    final String? logo;
    final String? minimumDeliveryTime;
    final String? maximumDeliveryTime;
    final dynamic tinNumber;
    final dynamic date;
    final dynamic tags;
    final dynamic licenseDocument;
    final String? latitude;
    final String? longitude;
    final String? address;
    final dynamic footerText;
    final String? minimumOrderAmount;
    final int? minimumShippingCharge;
    final dynamic perKmShippingCharge;
    final bool? freeDelivery;
    final String? userId;
    final List<int>? rating;
    final int? homeDelivery;
    final bool? takeAway;
    final bool? cutlery;
    final dynamic metaTitle;
    final dynamic metaDescription;
    final dynamic metaImage;
    final int? tax;
    final dynamic commission;
    final dynamic coverPhoto;
    final String? slug;
    final dynamic qrCode;
    final String? offDay;
    final DateTime? openingTime;
    final String? closingTime;
    final String? zoneId;
    final int? announcement;
    final dynamic announcementMessage;
    final int? veg;
    final int? nonVeg;
    final int? selfDeliverySystem;
    final bool? posSystem;
    final dynamic deliveryTime;
    final int? scheduleDelivery;
    final bool? foodSection;
    final bool? reviewsSection;
    final String? restaurantModel;
    final int? orderCount;
    final int? totalOrder;
    final dynamic maximumShippingCharge;
    final dynamic additionalData;
    final dynamic additionalDocuments;
    final int? countryId;
    final int? stateId;
    final int? cityId;
    final int? isActive;
    final int? isVerify;
    final int? closeTemporarily;
    final dynamic createdBy;
    final dynamic updatedBy;
    final dynamic deletedAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final bool? orderSubscriptionActive;
    final bool? freeDeliveryDistanceStatus;
    final String? freeDeliveryDistanceValue;
    final String? zoneName;
    final List<dynamic>? translations;
    final Zone? zone;

    Restaurant({
        this.id,
        this.restaurantName,
        this.phone,
        this.email,
        this.logo,
        this.minimumDeliveryTime,
        this.maximumDeliveryTime,
        this.tinNumber,
        this.date,
        this.tags,
        this.licenseDocument,
        this.latitude,
        this.longitude,
        this.address,
        this.footerText,
        this.minimumOrderAmount,
        this.minimumShippingCharge,
        this.perKmShippingCharge,
        this.freeDelivery,
        this.userId,
        this.rating,
        this.homeDelivery,
        this.takeAway,
        this.cutlery,
        this.metaTitle,
        this.metaDescription,
        this.metaImage,
        this.tax,
        this.commission,
        this.coverPhoto,
        this.slug,
        this.qrCode,
        this.offDay,
        this.openingTime,
        this.closingTime,
        this.zoneId,
        this.announcement,
        this.announcementMessage,
        this.veg,
        this.nonVeg,
        this.selfDeliverySystem,
        this.posSystem,
        this.deliveryTime,
        this.scheduleDelivery,
        this.foodSection,
        this.reviewsSection,
        this.restaurantModel,
        this.orderCount,
        this.totalOrder,
        this.maximumShippingCharge,
        this.additionalData,
        this.additionalDocuments,
        this.countryId,
        this.stateId,
        this.cityId,
        this.isActive,
        this.isVerify,
        this.closeTemporarily,
        this.createdBy,
        this.updatedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.orderSubscriptionActive,
        this.freeDeliveryDistanceStatus,
        this.freeDeliveryDistanceValue,
        this.zoneName,
        this.translations,
        this.zone,
    });

    factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        restaurantName: json["restaurant_name"],
        phone: json["phone"],
        email: json["email"],
        logo: json["logo"],
        minimumDeliveryTime: json["minimum_delivery_time"],
        maximumDeliveryTime: json["maximum_delivery_time"],
        tinNumber: json["tin_number"],
        date: json["date"],
        tags: json["tags"],
        licenseDocument: json["license_document"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
        footerText: json["footer_text"],
        minimumOrderAmount: json["minimum_order_amount"],
        minimumShippingCharge: json["minimum_shipping_charge"],
        perKmShippingCharge: json["per_km_shipping_charge"],
        freeDelivery: json["free_delivery"],
        userId: json["user_id"],
        rating: json["rating"] == null ? [] : List<int>.from(json["rating"]!.map((x) => x)),
        homeDelivery: json["home_delivery"],
        takeAway: json["take_away"],
        cutlery: json["cutlery"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaImage: json["meta_image"],
        tax: json["tax"],
        commission: json["commission"],
        coverPhoto: json["cover_photo"],
        slug: json["slug"],
        qrCode: json["qr_code"],
        offDay: json["off_day"],
        openingTime: json["opening_time"] == null ? null : DateTime.parse(json["opening_time"]),
        closingTime: json["closing_time"],
        zoneId: json["zone_id"],
        announcement: json["announcement"],
        announcementMessage: json["announcement_message"],
        veg: json["veg"],
        nonVeg: json["non_veg"],
        selfDeliverySystem: json["self_delivery_system"],
        posSystem: json["pos_system"],
        deliveryTime: json["delivery_time"],
        scheduleDelivery: json["schedule_delivery"],
        foodSection: json["food_section"],
        reviewsSection: json["reviews_section"],
        restaurantModel: json["restaurant_model"],
        orderCount: json["order_count"],
        totalOrder: json["total_order"],
        maximumShippingCharge: json["maximum_shipping_charge"],
        additionalData: json["additional_data"],
        additionalDocuments: json["additional_documents"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        isActive: json["is_active"],
        isVerify: json["is_verify"],
        closeTemporarily: json["close_temporarily"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        orderSubscriptionActive: json["order_subscription_active"],
        freeDeliveryDistanceStatus: json["free_delivery_distance_status"],
        freeDeliveryDistanceValue: json["free_delivery_distance_value"],
        zoneName: json["zone_name"],
        translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
        zone: json["zone"] == null ? null : Zone.fromJson(json["zone"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_name": restaurantName,
        "phone": phone,
        "email": email,
        "logo": logo,
        "minimum_delivery_time": minimumDeliveryTime,
        "maximum_delivery_time": maximumDeliveryTime,
        "tin_number": tinNumber,
        "date": date,
        "tags": tags,
        "license_document": licenseDocument,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "footer_text": footerText,
        "minimum_order_amount": minimumOrderAmount,
        "minimum_shipping_charge": minimumShippingCharge,
        "per_km_shipping_charge": perKmShippingCharge,
        "free_delivery": freeDelivery,
        "user_id": userId,
        "rating": rating == null ? [] : List<dynamic>.from(rating!.map((x) => x)),
        "home_delivery": homeDelivery,
        "take_away": takeAway,
        "cutlery": cutlery,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_image": metaImage,
        "tax": tax,
        "commission": commission,
        "cover_photo": coverPhoto,
        "slug": slug,
        "qr_code": qrCode,
        "off_day": offDay,
        "opening_time": openingTime?.toIso8601String(),
        "closing_time": closingTime,
        "zone_id": zoneId,
        "announcement": announcement,
        "announcement_message": announcementMessage,
        "veg": veg,
        "non_veg": nonVeg,
        "self_delivery_system": selfDeliverySystem,
        "pos_system": posSystem,
        "delivery_time": deliveryTime,
        "schedule_delivery": scheduleDelivery,
        "food_section": foodSection,
        "reviews_section": reviewsSection,
        "restaurant_model": restaurantModel,
        "order_count": orderCount,
        "total_order": totalOrder,
        "maximum_shipping_charge": maximumShippingCharge,
        "additional_data": additionalData,
        "additional_documents": additionalDocuments,
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
        "is_active": isActive,
        "is_verify": isVerify,
        "close_temporarily": closeTemporarily,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "order_subscription_active": orderSubscriptionActive,
        "free_delivery_distance_status": freeDeliveryDistanceStatus,
        "free_delivery_distance_value": freeDeliveryDistanceValue,
        "zone_name": zoneName,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x)),
        "zone": zone?.toJson(),
    };
}

class Zone {
    final String? id;
    final String? zoneName;
    final int? minimumDeliveryCharge;
    final int? maximumDeliveryCharge;
    final int? perKmDeliveryCharge;
    final int? maxCodOrderAmount;
    final int? increasedDeliveryCharge;
    final dynamic increaseDeliveryChargeMessage;
    final int? increasedDeliveryFeeStatus;
    final dynamic coordinates;
    final dynamic restaurantWiseTopic;
    final dynamic customerWiseTopic;
    final dynamic deliverymanWiseTopic;
    final int? isActive;
    final dynamic createdBy;
    final dynamic updatedBy;
    final dynamic deletedAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? cityId;

    Zone({
        this.id,
        this.zoneName,
        this.minimumDeliveryCharge,
        this.maximumDeliveryCharge,
        this.perKmDeliveryCharge,
        this.maxCodOrderAmount,
        this.increasedDeliveryCharge,
        this.increaseDeliveryChargeMessage,
        this.increasedDeliveryFeeStatus,
        this.coordinates,
        this.restaurantWiseTopic,
        this.customerWiseTopic,
        this.deliverymanWiseTopic,
        this.isActive,
        this.createdBy,
        this.updatedBy,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.cityId,
    });

    factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        id: json["id"],
        zoneName: json["zone_name"],
        minimumDeliveryCharge: json["minimum_delivery_charge"],
        maximumDeliveryCharge: json["maximum_delivery_charge"],
        perKmDeliveryCharge: json["per_km_delivery_charge"],
        maxCodOrderAmount: json["max_cod_order_amount"],
        increasedDeliveryCharge: json["increased_delivery_charge"],
        increaseDeliveryChargeMessage: json["increase_delivery_charge_message"],
        increasedDeliveryFeeStatus: json["increased_delivery_fee_status"],
        coordinates: json["coordinates"],
        restaurantWiseTopic: json["restaurant_wise_topic"],
        customerWiseTopic: json["customer_wise_topic"],
        deliverymanWiseTopic: json["deliveryman_wise_topic"],
        isActive: json["is_active"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        cityId: json["city_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "zone_name": zoneName,
        "minimum_delivery_charge": minimumDeliveryCharge,
        "maximum_delivery_charge": maximumDeliveryCharge,
        "per_km_delivery_charge": perKmDeliveryCharge,
        "max_cod_order_amount": maxCodOrderAmount,
        "increased_delivery_charge": increasedDeliveryCharge,
        "increase_delivery_charge_message": increaseDeliveryChargeMessage,
        "increased_delivery_fee_status": increasedDeliveryFeeStatus,
        "coordinates": coordinates,
        "restaurant_wise_topic": restaurantWiseTopic,
        "customer_wise_topic": customerWiseTopic,
        "deliveryman_wise_topic": deliverymanWiseTopic,
        "is_active": isActive,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "city_id": cityId,
    };
}

class User {
    final String? id;
    final String? firstName;
    final String? lastName;
    final String? phone;
    final String? email;
    final dynamic image;
    final int? isPhoneVerified;
    final dynamic emailVerifiedAt;
    final dynamic emailVerificationToken;
    final dynamic cmFirebaseToken;
    final int? isActive;
    final int? newsletterSubscribe;
    final int? isVerified;
    final String? verifyCode;
    final dynamic deletedAt;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? status;
    final int? orderCount;
    final dynamic loginMedium;
    final dynamic socialId;
    final dynamic zoneId;
    final int? walletBalance;
    final int? loyaltyPoint;
    final dynamic refCode;
    final dynamic refBy;
    final String? tempToken;
    final String? currentLanguageKey;

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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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

class Link {
    final String? url;
    final String? label;
    final bool? active;

    Link({
        this.url,
        this.label,
        this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
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
