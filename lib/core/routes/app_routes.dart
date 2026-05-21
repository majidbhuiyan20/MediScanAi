import 'package:flutter/material.dart';
import '../../features/onboarding/view/onboarding_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../constants/app_strings.dart';

class Routes{
  static const String splashRoute="/";
  static const String onboardingRoute="/onboarding";
  static const String loginRoute="/homeScreen";
}

class RouteGenerator{
  static Route<dynamic>getRoute(RouteSettings routeSettings){
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=> SplashScreen());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_)=> const OnboardingScreen());

      // case Routes.homeRoute:
      //   return MaterialPageRoute(builder: (_)=> const MainScreen());

      default:
        return unDefineRoute();
    }

  }
  static Route<dynamic>unDefineRoute(){
    return MaterialPageRoute(builder: (_)=>Scaffold(
      appBar: AppBar(title: Text(AppStrings.noRoute),),
      body: Center(child: Text(AppStrings.noRoute),),
    ));
  }
}