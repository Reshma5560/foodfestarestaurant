// To parse this JSON data, do
//
//     final getScheduleModel = getScheduleModelFromJson(jsonString);

import 'dart:convert';

GetScheduleModel getScheduleModelFromJson(String str) =>
    GetScheduleModel.fromJson(json.decode(str));

String getScheduleModelToJson(GetScheduleModel data) =>
    json.encode(data.toJson());

class GetScheduleModel {
  final bool? status;
  final GetScheduleData? data;

  GetScheduleModel({
    this.status,
    this.data,
  });

  factory GetScheduleModel.fromJson(Map<String, dynamic> json) =>
      GetScheduleModel(
        status: json["status"],
        data: json["data"] == null
            ? null
            : GetScheduleData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class GetScheduleData {
  final String? id;
  final String? restaurantName;
  final String? phone;
  final String? email;
  final String? logo;
  final String? minimumDeliveryTime;
  final String? maximumDeliveryTime;
  final String? tinNumber;
  final DateTime? date;
  final dynamic tags;
  final String? licenseDocument;
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
  final String? coverPhoto;
  final String? slug;
  final dynamic qrCode;
  final String? offDay;
  final String? gst;
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
  final dynamic freeDeliveryDistance;
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
  final RestaurantSchedule? restaurantSchedule;
  final List<dynamic>? translations;
  final Zone? zone;

  GetScheduleData({
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
    this.gst,
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
    this.freeDeliveryDistance,
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
    this.restaurantSchedule,
    this.translations,
    this.zone,
  });

  factory GetScheduleData.fromJson(Map<String, dynamic> json) =>
      GetScheduleData(
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
        gst: json["gst"],
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
        freeDeliveryDistance: json["free_delivery_distance"],
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
        freeDeliveryDistanceStatus: json["free_delivery_distance_status"],
        freeDeliveryDistanceValue: json["free_delivery_distance_value"],
        zoneName: json["zone_name"],
        restaurantSchedule: json["restaurant_schedule"] == null
            ? null
            : RestaurantSchedule.fromJson(json["restaurant_schedule"]),
        translations: json["translations"] == null
            ? []
            : List<dynamic>.from(json["translations"]!.map((x) => x)),
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
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
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
        "rating":
            rating == null ? [] : List<dynamic>.from(rating!.map((x) => x)),
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
        "gst": gst,
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
        "free_delivery_distance": freeDeliveryDistance,
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
        "restaurant_schedule": restaurantSchedule?.toJson(),
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x)),
        "zone": zone?.toJson(),
      };
}

class RestaurantSchedule {
  final String? id;
  final String? restaurantId;
  final String? saturdayOpening;
  final String? saturdayClosing;
  final String? sundayClosing;
  final String? sundayOpening;
  final String? mondayClosing;
  final String? mondayOpening;
  final String? tuesdayClosing;
  final String? tuesdayOpening;
  final String? wednesdayClosing;
  final String? wednesdayOpening;
  final String? thursdayClosing;
  final String? thursdayOpening;
  final String? fridayClosing;
  final String? fridayOpening;
  final dynamic createdBy;
  final dynamic updatedBy;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  RestaurantSchedule({
    this.id,
    this.restaurantId,
    this.saturdayOpening,
    this.saturdayClosing,
    this.sundayClosing,
    this.sundayOpening,
    this.mondayClosing,
    this.mondayOpening,
    this.tuesdayClosing,
    this.tuesdayOpening,
    this.wednesdayClosing,
    this.wednesdayOpening,
    this.thursdayClosing,
    this.thursdayOpening,
    this.fridayClosing,
    this.fridayOpening,
    this.createdBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory RestaurantSchedule.fromJson(Map<String, dynamic> json) =>
      RestaurantSchedule(
        id: json["id"],
        restaurantId: json["restaurant_id"],
        saturdayOpening: json["saturday_opening"],
        saturdayClosing: json["saturday_closing"],
        sundayClosing: json["sunday_closing"],
        sundayOpening: json["sunday_opening"],
        mondayClosing: json["monday_closing"],
        mondayOpening: json["monday_opening"],
        tuesdayClosing: json["tuesday_closing"],
        tuesdayOpening: json["tuesday_opening"],
        wednesdayClosing: json["wednesday_closing"],
        wednesdayOpening: json["wednesday_opening"],
        thursdayClosing: json["thursday_closing"],
        thursdayOpening: json["thursday_opening"],
        fridayClosing: json["friday_closing"],
        fridayOpening: json["friday_opening"],
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
        "restaurant_id": restaurantId,
        "saturday_opening": saturdayOpening,
        "saturday_closing": saturdayClosing,
        "sunday_closing": sundayClosing,
        "sunday_opening": sundayOpening,
        "monday_closing": mondayClosing,
        "monday_opening": mondayOpening,
        "tuesday_closing": tuesdayClosing,
        "tuesday_opening": tuesdayOpening,
        "wednesday_closing": wednesdayClosing,
        "wednesday_opening": wednesdayOpening,
        "thursday_closing": thursdayClosing,
        "thursday_opening": thursdayOpening,
        "friday_closing": fridayClosing,
        "friday_opening": fridayOpening,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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

// {
//     "status": true,
//     "data": {
//         "id": "9b533df4-50c3-4c24-80c8-8abb9af4d1d6",
//         "restaurant_name": "Italian Fast Food",
//         "phone": "8574123697",
//         "email": "italian@gmail.com",
//         "logo": "https://foodfiesta.omtecweb.com/storage/restaurant/1.png",
//         "minimum_delivery_time": "10",
//         "maximum_delivery_time": "20",
//         "tin_number": "53454",
//         "date": "2024-02-14",
//         "tags": null,
//         "license_document": "/tmp/phpQT7ifq",
//         "latitude": "23.43469934021078",
//         "longitude": "81.33096221557581",
//         "address": "Pizzas, Italian, Pastas, Desserts Adajan Gam",
//         "footer_text": null,
//         "minimum_order_amount": "0.00",
//         "minimum_shipping_charge": 0,
//         "per_km_shipping_charge": null,
//         "free_delivery": false,
//         "user_id": "9b533df4-4fce-4918-8d34-17d38de29978",
//         "rating": [
//             0,
//             0,
//             0,
//             0,
//             0
//         ],
//         "home_delivery": 0,
//         "take_away": false,
//         "cutlery": false,
//         "meta_title": null,
//         "meta_description": null,
//         "meta_image": null,
//         "tax": 0,
//         "commission": null,
//         "cover_photo": "https://foodfiesta.omtecweb.com/storage/restaurant/17079138271.png",
//         "slug": "",
//         "qr_code": null,
//         "off_day": "1",
//         "opening_time": "2024-02-19T10:00:00.000000Z",
//         "closing_time": "23:00:00",
//         "zone_id": "9b533df3-f039-4016-8020-18bc89f81e2c",
//         "announcement": 0,
//         "announcement_message": null,
//         "veg": 1,
//         "non_veg": 0,
//         "self_delivery_system": 0,
//         "pos_system": false,
//         "delivery_time": null,
//         "schedule_delivery": 1,
//         "food_section": true,
//         "reviews_section": true,
//         "restaurant_model": "commission",
//         "order_count": 0,
//         "total_order": 0,
//         "maximum_shipping_charge": null,
//         "additional_data": null,
//         "additional_documents": null,
//         "country_id": 101,
//         "state_id": 4030,
//         "city_id": 1,
//         "is_active": 1,
//         "is_verify": 1,
//         "close_temporarily": 1,
//         "created_by": null,
//         "updated_by": null,
//         "deleted_at": null,
//         "created_at": "2024-02-13T09:57:20.000000Z",
//         "updated_at": "2024-02-19T11:10:04.000000Z",
//         "order_subscription_active": false,
//         "free_delivery_distance_status": false,
//         "free_delivery_distance_value": "",
//         "zone_name": "Zone1",
//         "restaurant_schedule": [
//             {
//                 "id": "9b5577b0-5d6a-436e-894b-1574f5ccc617",
//                 "restaurant_id": "9b533df4-50c3-4c24-80c8-8abb9af4d1d6",
//                 "saturday_opening": "1:30",
//                 "saturday_closing": "2:30",
//                 "sunday_closing": "0",
//                 "sunday_opening": "0",
//                 "monday_closing": "0",
//                 "monday_opening": "0",
//                 "tuesday_closing": "0",
//                 "tuesday_opening": "0",
//                 "wednesday_closing": "0",
//                 "wednesday_opening": "0",
//                 "thursday_closing": "0",
//                 "thursday_opening": "0",
//                 "friday_closing": "0",
//                 "friday_opening": "0",
//                 "created_by": null,
//                 "updated_by": null,
//                 "deleted_at": null,
//                 "created_at": "2024-02-14T12:30:25.000000Z",
//                 "updated_at": "2024-02-19T11:20:02.000000Z"
//             }
//         ],
//         "translations": [],
//         "zone": {
//             "id": "9b533df3-f039-4016-8020-18bc89f81e2c",
//             "zone_name": "Zone1",
//             "minimum_delivery_charge": 30,
//             "maximum_delivery_charge": 15,
//             "per_km_delivery_charge": 5,
//             "max_cod_order_amount": 100,
//             "increased_delivery_charge": 0,
//             "increase_delivery_charge_message": null,
//             "increased_delivery_fee_status": 0,
//             "coordinates": null,
//             "restaurant_wise_topic": null,
//             "customer_wise_topic": null,
//             "deliveryman_wise_topic": null,
//             "is_active": 1,
//             "created_by": null,
//             "updated_by": null,
//             "deleted_at": null,
//             "created_at": "2024-02-13T09:57:19.000000Z",
//             "updated_at": "2024-02-13T09:57:19.000000Z",
//             "city_id": "1"
//         }
//     }
// }