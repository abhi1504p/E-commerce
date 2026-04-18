import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/core/theme/app_theme.dart';

import 'package:shoppingapp/routes/app_routes.dart';
import 'package:shoppingapp/routes/route_generator.dart';

import 'core/providers/app_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(
    MultiProvider(providers: AppProviders.providers, child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.register,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
