// To parse this JSON data, do
//
//      GetOrderByIdModel = GetOrderByIdModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

GetOrderByIdModel GetOrderByIdModelFromJson(String str) =>
    GetOrderByIdModel.fromJson(json.decode(str));

class GetOrderByIdModel {
  bool? status;
  OrderTrackData? data;

  GetOrderByIdModel({
    this.status,
    this.data,
  });

  factory GetOrderByIdModel.fromJson(Map<String, dynamic> json) =>
      GetOrderByIdModel(
        status: json["status"],
        data:
            json["data"] == null ? null : OrderTrackData.fromJson(json["data"]),
      );
}

class OrderTrackData {
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
  dynamic deliveryManId;
  dynamic deliveryManRemarks;
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
  DeliveryAddress? deliveryAddress;
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
  User? user;
  Status? orderStatus;
  Status? paymentStatus;
  PaymentType? paymentType;
  Restaurant? restaurant;
  dynamic deliveryMan;
  List<OrderDetail>? orderDetail;

  OrderTrackData({
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
    this.orderStatus,
    this.paymentStatus,
    this.paymentType,
    this.restaurant,
    this.deliveryMan,
    this.orderDetail,
  });

  factory OrderTrackData.fromJson(Map<String, dynamic> json) => OrderTrackData(
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
        deliveryAddress: json["delivery_address"] == null
            ? null
            : DeliveryAddress.fromJson(json["delivery_address"]),
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
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        orderStatus: json["order_status"] == null
            ? null
            : Status.fromJson(json["order_status"]),
        paymentStatus: json["payment_status"] == null
            ? null
            : Status.fromJson(json["payment_status"]),
        paymentType: json["payment_type"] == null
            ? null
            : PaymentType.fromJson(json["payment_type"]),
        restaurant: json["restaurant"] == null
            ? null
            : Restaurant.fromJson(json["restaurant"]),
        deliveryMan: json["delivery_man"],
        orderDetail: json["order_detail"] == null
            ? []
            : List<OrderDetail>.from(
                json["order_detail"]!.map((x) => OrderDetail.fromJson(x))),
      );
}

class DeliveryAddress {
  String? id;
  String? addressType;
  String? contactPersonNumber;
  String? address;
  String? latitude;
  String? longitude;
  String? userId;
  dynamic zoneId;
  String? contactPersonName;
  dynamic floor;
  dynamic road;
  dynamic house;
  int? isActive;
  int? isDefault;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? countryId;
  int? stateId;
  int? cityId;
  String? zipCode;
  Country? country;
  State? state;
  City? city;

  DeliveryAddress({
    this.id,
    this.addressType,
    this.contactPersonNumber,
    this.address,
    this.latitude,
    this.longitude,
    this.userId,
    this.zoneId,
    this.contactPersonName,
    this.floor,
    this.road,
    this.house,
    this.isActive,
    this.isDefault,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.countryId,
    this.stateId,
    this.cityId,
    this.zipCode,
    this.country,
    this.state,
    this.city,
  });

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      DeliveryAddress(
        id: json["id"],
        addressType: json["address_type"],
        contactPersonNumber: json["contact_person_number"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        userId: json["user_id"],
        zoneId: json["zone_id"],
        contactPersonName: json["contact_person_name"],
        floor: json["floor"],
        road: json["road"],
        house: json["house"],
        isActive: json["is_active"],
        isDefault: json["is_default"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        zipCode: json["zip_code"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        state: json["state"] == null ? null : State.fromJson(json["state"]),
        city: json["city"] == null ? null : City.fromJson(json["city"]),
      );
}

class City {
  int? id;
  int? stateId;
  String? cityName;
  String? latitude;
  String? longitude;
  int? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  City({
    this.id,
    this.stateId,
    this.cityName,
    this.latitude,
    this.longitude,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        stateId: json["state_id"],
        cityName: json["city_name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
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
}

class Country {
  int? id;
  String? countryName;
  String? shortName;
  String? countryCode;
  int? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Country({
    this.id,
    this.countryName,
    this.shortName,
    this.countryCode,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        countryName: json["country_name"],
        shortName: json["short_name"],
        countryCode: json["country_code"],
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
}

class State {
  int? id;
  int? countryId;
  String? stateName;
  int? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  State({
    this.id,
    this.countryId,
    this.stateName,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        countryId: json["country_id"],
        stateName: json["state_name"],
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
}

class OrderDetail {
  String? id;
  String? orderId;
  String? foodId;
  double? price;
  String? totalAmount;
  dynamic tax;
  dynamic discount;
  List<Variant>? variant;
  List<Addon>? addon;
  int? quantity;
  dynamic foodDetails;
  DateTime? createdAt;
  DateTime? updatedAt;
  Food? food;

  OrderDetail({
    this.id,
    this.orderId,
    this.foodId,
    this.price,
    this.totalAmount,
    this.tax,
    this.discount,
    this.variant,
    this.addon,
    this.quantity,
    this.foodDetails,
    this.createdAt,
    this.updatedAt,
    this.food,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        orderId: json["order_id"],
        foodId: json["food_id"],
        price: json["price"]?.toDouble(),
        totalAmount: json["total_amount"],
        tax: json["tax"],
        discount: json["discount"],
        variant: json["variant"] == null
            ? []
            : List<Variant>.from(
                json["variant"]!.map((x) => Variant.fromJson(x))),
        addon: json["addon"] == null
            ? []
            : List<Addon>.from(json["addon"]!.map((x) => Addon.fromJson(x))),
        quantity: json["quantity"],
        foodDetails: json["food_details"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        food: json["food"] == null ? null : Food.fromJson(json["food"]),
      );
}

class Addon {
  String? id;
  String? addonName;
  int? price;
  String? restaurantId;
  int? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Addon({
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

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
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
}

class Food {
  String? id;
  String? foodName;
  String? description;
  String? image;
  String? categoryId;
  String? categoryIds;
  List<dynamic>? variations;
  String? addOns;
  dynamic attributes;
  dynamic choiceOptions;
  int? price;
  int? tax;
  String? taxType;
  double? discount;
  String? discountType;
  String? availableTimeStarts;
  String? availableTimeEnds;
  int? veg;
  int? status;
  String? restaurantId;
  int? avgRating;
  String? ratingCount;
  dynamic rating;
  String? slug;
  int? recommended;
  int? orderCount;
  int? minimumCartQuantity;
  int? maximumCartQuantity;
  int? isActive;
  dynamic createdBy;
  String? updatedBy;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? commentsCount;
  List<dynamic>? translations;

  Food({
    this.id,
    this.foodName,
    this.description,
    this.image,
    this.categoryId,
    this.categoryIds,
    this.variations,
    this.addOns,
    this.attributes,
    this.choiceOptions,
    this.price,
    this.tax,
    this.taxType,
    this.discount,
    this.discountType,
    this.availableTimeStarts,
    this.availableTimeEnds,
    this.veg,
    this.status,
    this.restaurantId,
    this.avgRating,
    this.ratingCount,
    this.rating,
    this.slug,
    this.recommended,
    this.orderCount,
    this.minimumCartQuantity,
    this.maximumCartQuantity,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.commentsCount,
    this.translations,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["id"],
        foodName: json["food_name"],
        description: json["description"],
        image: json["image"],
        categoryId: json["category_id"],
        categoryIds: json["category_ids"],
        variations: json["variations"] == null
            ? []
            : List<dynamic>.from(json["variations"]!.map((x) => x)),
        addOns: json["add_ons"],
        attributes: json["attributes"],
        choiceOptions: json["choice_options"],
        price: json["price"],
        tax: json["tax"],
        taxType: json["tax_type"],
        discount: double.parse(json["discount"].toString()),
        discountType: json["discount_type"],
        availableTimeStarts: json["available_time_starts"],
        availableTimeEnds: json["available_time_ends"],
        veg: json["veg"],
        status: json["status"],
        restaurantId: json["restaurant_id"],
        avgRating: json["avg_rating"],
        ratingCount: json["rating_count"],
        rating: json["rating"],
        slug: json["slug"],
        recommended: json["recommended"],
        orderCount: json["order_count"],
        minimumCartQuantity: json["minimum_cart_quantity"],
        maximumCartQuantity: json["maximum_cart_quantity"],
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
        commentsCount: json["comments_count"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );
}

class Variant {
  String? id;
  String? foodId;
  String? foodVariationId;
  String? variationOptionName;
  String? price;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  FoodVariant? foodVariant;

  Variant({
    this.id,
    this.foodId,
    this.foodVariationId,
    this.variationOptionName,
    this.price,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.foodVariant,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        foodId: json["food_id"],
        foodVariationId: json["food_variation_id"],
        variationOptionName: json["variation_option_name"],
        price: json["price"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        foodVariant: json["food_variant"] == null
            ? null
            : FoodVariant.fromJson(json["food_variant"]),
      );
}

class FoodVariant {
  String? id;
  String? foodId;
  String? variationName;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  FoodVariant({
    this.id,
    this.foodId,
    this.variationName,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory FoodVariant.fromJson(Map<String, dynamic> json) => FoodVariant(
        id: json["id"],
        foodId: json["food_id"],
        variationName: json["variation_name"],
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
}

class Status {
  String? id;
  String? status;
  String? statusName;
  int? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}

class PaymentType {
  String? id;
  String? paymentTypeName;
  String? description;
  String? value;
  int? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  PaymentType({
    this.id,
    this.paymentTypeName,
    this.description,
    this.value,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory PaymentType.fromJson(Map<String, dynamic> json) => PaymentType(
        id: json["id"],
        paymentTypeName: json["payment_type_name"],
        description: json["description"],
        value: json["value"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );
}

class Restaurant {
  String? id;
  String? restaurantName;
  String? phone;
  String? email;
  String? logo;
  String? minimumDeliveryTime;
  String? maximumDeliveryTime;
  String? tinNumber;
  DateTime? date;
  dynamic tags;
  String? licenseDocument;
  String? latitude;
  String? longitude;
  String? address;
  dynamic footerText;
  String? minimumOrderAmount;
  int? minimumShippingCharge;
  dynamic perKmShippingCharge;
  bool? freeDelivery;
  String? userId;
  List<int>? rating;
  int? homeDelivery;
  bool? takeAway;
  bool? cutlery;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaImage;
  int? tax;
  dynamic commission;
  String? coverPhoto;
  String? slug;
  dynamic qrCode;
  String? offDay;
  DateTime? openingTime;
  String? closingTime;
  String? zoneId;
  int? announcement;
  dynamic announcementMessage;
  int? veg;
  int? nonVeg;
  int? selfDeliverySystem;
  bool? posSystem;
  dynamic deliveryTime;
  int? scheduleDelivery;
  bool? foodSection;
  bool? reviewsSection;
  String? restaurantModel;
  int? orderCount;
  int? totalOrder;
  dynamic maximumShippingCharge;
  dynamic additionalData;
  dynamic additionalDocuments;
  int? countryId;
  int? stateId;
  int? cityId;
  int? isActive;
  int? isVerify;
  int? closeTemporarily;
  dynamic createdBy;
  dynamic updatedBy;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? orderSubscriptionActive;
  bool? gstStatus;
  String? gstCode;
  bool? freeDeliveryDistanceStatus;
  String? freeDeliveryDistanceValue;
  List<dynamic>? translations;

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
    this.gstStatus,
    this.gstCode,
    this.freeDeliveryDistanceStatus,
    this.freeDeliveryDistanceValue,
    this.translations,
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
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
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
        rating: json["rating"] == null
            ? []
            : List<int>.from(json["rating"]!.map((x) => x)),
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
        openingTime: json["opening_time"] == null
            ? null
            : DateTime.parse(json["opening_time"]),
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        orderSubscriptionActive: json["order_subscription_active"],
        gstStatus: json["gst_status"],
        gstCode: json["gst_code"],
        freeDeliveryDistanceStatus: json["free_delivery_distance_status"],
        freeDeliveryDistanceValue: json["free_delivery_distance_value"],
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
      );
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
  String? verifyCode;
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
  String? tempToken;
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
}
