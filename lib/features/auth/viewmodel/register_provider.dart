import 'package:flutter/material.dart';
import 'package:shoppingapp/features/auth/data/model/auth_model.dart';
import 'package:shoppingapp/features/auth/data/repository/auth_repository.dart';

class RegisterProvider extends ChangeNotifier {
  final AuthRepository registerRepository;

  RegisterProvider(this.registerRepository);

  bool isloading = false;
  String? errorMsg;

  Future<bool> registerUser(String name, String password) async {
    isloading = true;
    errorMsg = null;
    notifyListeners();
    try {
      final user = AuthModel(name: name, password: password);
      final success = await registerRepository.register(user);
      return success;
    } catch (e) {
      errorMsg = e.toString();
      return false;
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
