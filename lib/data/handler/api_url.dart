import '../../app_environment.dart';

class ApiUrls {
  static String baseUrl = AppEnvironment().getApiURL();

  static String restaurantUrl = "restaurant/";

  //? Auth Api's
  static String loginUrl = "restaurant-login";
  static String registerUrl = "auth/sign-up";
  static String verifyToken = "auth/verify-token";
  static String changePassword = "users/change-password";
  static String deleteAccount = "users/delete-account";
  static String logoutUrl = "auth/logout";
  static String getProfileUrl = "get-profile";
  static String updateUserProfileUrl = "update-profile";
  static String updatePasswordUrl = "update-password";
  static String forgotPasswordUrl = "forgot-password";

//order

  static String getRequestOrderUrl = "get-request-order";
  static String getCurrentOrderUrl = "get-current-order";
  static String getCompleteOrderUrl = "get-completed-order";
  static String getOrderByIdUrl = "order-detail";
  static String acceptOrderUrl = "accept-order";

  //food
  static String getFoodUrl = "get-food";
  static String getFoodDetailsUrl = "food-detail";

//addon
  static String getAddonsUrl = "get-addon";
  static String addAddonsUrl = "add-addon";
  static String addonsDetailUrl = "addon-detail";

//account
  static String getDeliveryManUrl = "get-deliveryman";
  static String getCustomerUrl = "get-customer";

// //? Bottombar Api's
// static String groups = "group/group-list";
// static String newGroup = "group/new-group";
// static String newGroupJoin = "group/join/";
//
// //? Notification Api's
// static String getAllNotification = "notification";
// static String notificationDeleteById = "notification/delete-by-id/";
// static String notificationDeleteAll = "notification/delete-all";
// static String readSingleNotification = "notification/read-single/";
//
// //? Group Api's
// static String groupDetails = "group/details/";
// static String createGroup = "researchers/group";
// static String updateGroup = "researchers/group/";
// static String deleteGroup = "researchers/group/delete/";
// static String leaveGroup = "group/leave/";
// static String homeTips = "tip/dashboard/home-screen/";
// static String stockTypes = "/tip/dashboard/stock-types";
// static String groupMembers = "/researchers/group/members/";
// static String removeMember = "/researchers/group/remove-member/";
}
