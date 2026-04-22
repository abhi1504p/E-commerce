import 'package:flutter/material.dart';
import 'package:shoppingapp/features/Home/view/home_view.dart';
import 'package:shoppingapp/features/auth/view/login_view.dart';
import '../features/auth/view/register_view.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.register:
        return MaterialPageRoute(builder: (context) => const RegisterView());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => const HomeView());

      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text("Route not found"))),
        );
    }
  }
}
