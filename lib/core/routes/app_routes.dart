import 'package:chef_app/feature/auth/presentation/screens/change_language_screen.dart';
import 'package:chef_app/feature/auth/presentation/screens/login_screen.dart';
import 'package:chef_app/feature/auth/presentation/screens/send_code_screen.dart';
import 'package:chef_app/feature/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/presentation/screens/reset_password_screen.dart';
import '../../feature/menu/presentation/screens/add_meal_screen.dart';
import '../../feature/menu/presentation/screens/menu_home_screen.dart';
import '../../feature/profile/presentation/screens/change_password_screen.dart';
import '../../feature/profile/presentation/screens/profile_home_screen.dart';
import '../../feature/profile/presentation/screens/settings_screen.dart';
import '../../feature/profile/presentation/screens/update_profile_screen.dart';
import '../widgets/under_maintenance_widget.dart';
//! Routes Path
class Routes {
  static const String initialRoute = '/';
  static const String changeLanguage = '/changeLanguage';
  static const String login = '/login';
  static const String sendCode = '/sendCode';
  static const String resetPassword = '/resetPassword';
  static const String menuHome = '/menuHome';
  static const String addMeal = '/addMeal';
  static const String profileHome = '/profileHome';
  static const String updateProfile = '/updateProfile';
  static const String changePassword = '/changePassword';
  static const String settings = '/settings';
}

//! Generate Routes
class AppRoutes {
  static Route? generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.changeLanguage:
        return MaterialPageRoute(
            builder: (context) => const ChangeLanguageScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.sendCode:
        return MaterialPageRoute(builder: (context) => const SendCodeScreen());
      case Routes.resetPassword:
        return MaterialPageRoute(
            builder: (context) => const ResetPasswordScreen());
      case Routes.menuHome:
        return MaterialPageRoute(builder: (context) => const MenuHomeScreen());
      case Routes.addMeal:
        return MaterialPageRoute(builder: (context) => const AddMealScreen());
      case Routes.profileHome:
        return MaterialPageRoute(
            builder: (context) => const ProfileHomeScreen());
      case Routes.updateProfile:
        return MaterialPageRoute(
            builder: (context) => const UpdateProfileScreen());
      case Routes.changePassword:
        return MaterialPageRoute(
            builder: (context) => const ChangePasswordScreen());
      case Routes.settings:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const UnderMaintenanceScreen());
    }
  }
}
