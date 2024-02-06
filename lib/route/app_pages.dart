import 'package:foodfestarestaurant/view/account/widgets/display_customer_screen.dart';
import 'package:foodfestarestaurant/view/account/widgets/display_delivery_man_screen.dart';
import 'package:foodfestarestaurant/view/account/widgets/edit_account_screen.dart';
import 'package:foodfestarestaurant/view/account/widgets/update_password_screen.dart';
import 'package:foodfestarestaurant/view/auth/forgot_password_screen.dart';
import 'package:foodfestarestaurant/view/index/bottom_screen.dart';
import 'package:foodfestarestaurant/view/index/widgets/home/food/widget/add_food_screen.dart';
import 'package:foodfestarestaurant/view/index/widgets/home/food/widget/food_detail_screen.dart';
import 'package:foodfestarestaurant/view/index/widgets/home/widget/order_detail_screen.dart';
import 'package:get/get.dart';

import '../view/auth/login_screen.dart';
import '../view/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.bottomScreen,
      page: () => BottomScreen(),
    ),
    GetPage(
      name: AppRoutes.updatePasswordScreen,
      page: () => UpdatePasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: AppRoutes.editAccountScreen,
      page: () => EditAccountScreen(),
    ),
    GetPage(
      name: AppRoutes.orderDetailScreen,
      page: () => OrderDetailScreen(),
    ),
    GetPage(
      name: AppRoutes.displayDeliveryManScreen,
      page: () => DisplayDeliveryManScreen(),
    ),
    GetPage(
      name: AppRoutes.displayCustomerScreen,
      page: () => DisplayCustomerScreen(),
    ),
    GetPage(
      name: AppRoutes.foodDetailsScreen,
      page: () => FoodDetailsScreen(),
    ),
    GetPage(
      name: AppRoutes.addFoodScreen,
      page: () => AddFoodScreen(),
    ),
  ];
}
