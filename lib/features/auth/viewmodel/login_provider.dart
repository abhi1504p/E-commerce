import 'package:flutter/cupertino.dart';
import 'package:shoppingapp/features/auth/data/model/auth_model.dart';
import 'package:shoppingapp/features/auth/data/repository/auth_repository.dart';
// import 'package:provider/provider.dart';

class LoginProvider extends ChangeNotifier {
  final AuthRepository authRepository;

  // ignore: ddc_missing_field_initialization
  LoginProvider(this.authRepository,);

  bool isloading = false;
  String? errorMsg;

  Future<bool> loginUser(String name, String password) async {
    isloading = true;
    errorMsg = null;
    notifyListeners();
    try {
      final user = AuthModel(name: name, password: password);
      final success = await authRepository.login(user);
      return success;
    } catch (e) {
      errorMsg = e.toString();
      return false;
    }
    finally {
      isloading = false;
      notifyListeners();
    }
  }
}