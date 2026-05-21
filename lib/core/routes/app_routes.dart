import 'package:flutter/material.dart';
import '../../features/onboarding/view/onboarding_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/bottom_nav/view/bottom_nav_screen.dart';
import '../constants/app_strings.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onboardingRoute = "/onboarding";
  static const String mainRoute = "/main";
  static const String loginRoute = "/login"; // Placeholder for now
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const BottomNavScreen());
      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRoute),
              ),
              body: const Center(
                child: Text(AppStrings.noRoute),
              ),
            ));
  }
}
