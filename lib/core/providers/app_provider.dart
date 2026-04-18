import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shoppingapp/features/auth/data/services/auth_api.dart';
import 'package:shoppingapp/features/auth/viewmodel/login_provider.dart';
import 'package:shoppingapp/features/auth/viewmodel/register_provider.dart';
import 'package:shoppingapp/features/auth/data/repository/auth_repository.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<RegisterProvider>(
      create: (_) => RegisterProvider(AuthRepository(AuthApi())),
    ),
    ChangeNotifierProvider(
      create: (_) => LoginProvider(AuthRepository(AuthApi())),
    ),
  ];
}
