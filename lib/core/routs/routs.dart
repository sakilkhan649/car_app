import 'package:car_app/views/%20%20onboarding_screens/onboarding_screen.dart';
import 'package:car_app/views/auth_screen/check_email_screen.dart';
import 'package:car_app/views/auth_screen/register_screen.dart';
import 'package:car_app/views/home_screens/category_screen/category_screen.dart';
import 'package:car_app/views/home_screens/home_screen/home_screen.dart';
import 'package:car_app/views/splash_screens/splash_screen.dart';
import 'package:get/get.dart';
import '../../views/auth_screen/forget_otp_screen.dart';
import '../../views/auth_screen/forget_password_screen.dart';
import '../../views/auth_screen/login_screen.dart';
import '../../views/auth_screen/set_new_password_screen.dart';
import '../../views/home_screens/main_home_screen/Drawer/user_profile_screen/basic_information_screen/basic_information_screen.dart';
import '../../views/home_screens/main_home_screen/Drawer/user_profile_screen/change_contract_screen/change_contract_screen.dart';
import '../../views/home_screens/main_home_screen/Drawer/user_profile_screen/change_password_screen/change_password_screen.dart';
import '../../views/home_screens/main_home_screen/Drawer/user_profile_screen/check_email_otp_screen/check_email_otp_screen.dart';
import '../../views/home_screens/main_home_screen/Drawer/user_profile_screen/user_profile_screen.dart';
import '../../views/home_screens/main_home_screen/main_home_screen.dart';
import '../../views/home_screens/main_home_screen/notifications_screen/notifications_screen.dart';
import '../../views/home_screens/products_screen/products_screen.dart';
import '../../views/home_screens/seller_screen/seller_screen.dart';

class Routes {
  static const String splashScreen = "/SplashScreen";
  static const String onboardingScreen = "/OnboardingScreen";
  static const String homeScreen = "/HomeScreen";
  static const String loginScreen = "/LoginScreen";
  static const String registerScreen = "/RegisterScreen";
  static const String checkEmailScreen = "/CheckEmailScreen";
  static const String forgetPasswordScreen = "/ForgetPasswordScreen";
  static const String forgetOtpScreen = "/ForgetOtpScreen";
  static const String setNewPasswordScreen = "/SetNewPasswordScreen";
  static const String mainHomeScreen = "/MainHomeScreen";
  static const String productsScreen = "/ProductsScreen";
  static const String categoryScreen = "/CategoryScreen";
  static const String sellerScreen = "/SellerScreen";
  static const String notificationsScreen = "/NotificationsScreen";
  static const String userProfileScreen = "/UserProfileScreen";
  static const String basicInformationScreen = "/BasicInformationScreen";
  static const String changeContractScreen = "/ChangeContractScreen";
  static const String checkEmailOtpScreen = "/CheckEmailOtpScreen";
  static const String changePasswordScreen = "/ChangePasswordScreen";

  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: onboardingScreen,
      page: () => OnboardingScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: registerScreen,
      page: () => RegisterScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: checkEmailScreen,
      page: () => CheckEmailScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: forgetOtpScreen,
      page: () => ForgetOtpScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: setNewPasswordScreen,
      page: () => SetNewPasswordScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: mainHomeScreen,
      page: () => MainHomeScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: productsScreen,
      page: () => ProductsScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: categoryScreen,
      page: () => CategoryScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: sellerScreen,
      page: () => SellerScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: notificationsScreen,
      page: () => NotificationsScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: userProfileScreen,
      page: () => UserProfileScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: basicInformationScreen,
      page: () => BasicInformationScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: changeContractScreen,
      page: () => ChangeContractScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: checkEmailOtpScreen,
      page: () => CheckEmailOtpScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: changePasswordScreen,
      page: () => ChangePasswordScreen(),
      transition: Transition.noTransition,
    ),
  ];
}
