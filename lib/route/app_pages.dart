import 'package:foodfestarestaurant/view/account/widgets/edit_account_screen.dart';
import 'package:foodfestarestaurant/view/account/widgets/update_password_screen.dart';
import 'package:foodfestarestaurant/view/auth/forgot_password_screen.dart';
import 'package:foodfestarestaurant/view/index/bottom_screen.dart';
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
  ];
}
