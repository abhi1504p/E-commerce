import 'package:shoppingapp/features/auth/data/model/auth_model.dart';
import 'package:shoppingapp/features/auth/data/services/auth_api.dart';

class AuthRepository {
  final AuthApi authApi;

  AuthRepository(this.authApi);

  Future<bool> register(AuthModel register) async {
    return await authApi.registerUser(register);
  }
  Future<bool> login(AuthModel login)async{
    return await authApi.loginUser(login);
  }

}
