import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingapp/core/constant/app_logger.dart';
import 'package:shoppingapp/core/theme/app_theme.dart';

import 'package:shoppingapp/routes/app_routes.dart';
import 'package:shoppingapp/routes/route_generator.dart';

import 'core/providers/app_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final initialRoute = await getInitialRoute();
  runApp(
    MultiProvider(
      providers: AppProviders.providers,
      child: MyApp(initialRoute: initialRoute),
    ),
  );
}

Future<String> getInitialRoute() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool? a = preferences.getBool("isLoggedIn");
  AppLogger.i("value ${a}");

  a ??= false;

  if (a) {
    return AppRoutes.home;
  } else {
    return AppRoutes.register;
  }
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      theme: AppTheme.lightTheme,
      initialRoute: initialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
