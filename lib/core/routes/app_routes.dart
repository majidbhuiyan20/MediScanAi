import 'package:flutter/material.dart';
import 'package:mediscanai/features/home/view/processing_report_screen.dart';
import 'package:mediscanai/features/home/view/report_detected_screen.dart';
import 'package:mediscanai/features/home/view/upload_report_screen.dart';
import 'package:mediscanai/features/home/view/view_report_screen.dart';
import '../../features/onboarding/view/onboarding_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/bottom_nav/view/bottom_nav_screen.dart';
import '../constants/app_strings.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onboardingRoute = "/onboarding";
  static const String mainRoute = "/main";
  static const String loginRoute = "/login"; // Placeholder for now
  static const String uploadReportScreen = "/uploadReportScreen";
  static const String processingReportScreen = "/processingReportScreen";
  static const String reportDetectedScreen = "/reportDetectedScreen";
  static const String viewReportScreen = "/viewReportScreen";
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
      case Routes.uploadReportScreen:
        return MaterialPageRoute(builder: (_) => const UploadReportScreen());
      case Routes.processingReportScreen:
        return MaterialPageRoute(builder: (_) => const ProcessingReportScreen());
      case Routes.reportDetectedScreen:
        return MaterialPageRoute(builder: (_) => const ReportDetectedScreen());
      case Routes.viewReportScreen:
        return MaterialPageRoute(builder: (_) => const ViewReportScreen());
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
