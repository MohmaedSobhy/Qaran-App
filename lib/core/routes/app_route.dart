import 'package:flutter/material.dart';
import 'package:hafiz_app/Feature/get_started/presentation/screens/get_started_screen.dart';
import 'package:hafiz_app/Feature/home/presentation/screens/home_screen.dart';
import 'package:hafiz_app/core/routes/base_route.dart';

abstract class AppRoute {
  static const String getStartedScreen = '/getStarted';
  static const String homeScreen = '/HomeScreen';
  static String suraScreen = '/SuraScreen';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case getStartedScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const GetStartedScreen();
          },
        );
      case homeScreen:
        return BaseRoute(pageBuilder: (_, __, ___) {
          return const HomeScreen();
        });
    }
    return null;
  }
}
