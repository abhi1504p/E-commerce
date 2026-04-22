import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shoppingapp/features/Home/provider/home_provider.dart';
import 'package:shoppingapp/features/auth/data/services/auth_api.dart';
import 'package:shoppingapp/features/auth/data/repository/auth_repository.dart';

import '../../features/auth/provider/login_provider.dart';
import '../../features/auth/provider/register_provider.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<RegisterProvider>(
      create: (_) => RegisterProvider(AuthRepository(AuthApi())),
    ),
    ChangeNotifierProvider(
      create: (_) => LoginProvider(AuthRepository(AuthApi())),
    ),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
  ];
}
