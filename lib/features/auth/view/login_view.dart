import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/core/constant/app_logger.dart';
import 'package:shoppingapp/core/constant/app_snackbar.dart';
import 'package:shoppingapp/core/widgets/button_widget.dart';
import 'package:shoppingapp/core/widgets/custom_appbar.dart';


import '../../../routes/app_routes.dart';
import '../provider/login_provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

TextEditingController name = TextEditingController();
TextEditingController password = TextEditingController();

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50), child: CustomAppBar(title: "Login")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            spacing: 20,
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                ),
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
              ),
              Consumer<LoginProvider>(
                builder: (context, provider, child) {
                  if (provider.isloading) {
                    return CircularProgressIndicator();
                  } else {
                    return ButtonWidget(
                      onTap: () async {
                        final success = await provider.loginUser(
                          name.text.trim(),
                          password.text.trim(),
                        );
                        if (!mounted) return;
                        if (success) {
                          AppSnackbar.show(
                            context,
                            message: 'login Successfully',
                          );
                          await Future.delayed(const Duration(seconds: 2));
                          Navigator.pushReplacementNamed(context, AppRoutes.home);
                        } else {
                          AppSnackbar.show(
                            context,
                            message: provider.errorMsg.toString(),
                          );
                        }
                      },
                      text: "login",
                    );
                  }
                },
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do the Login"),
                  TextButton(onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.register);
                  }, child: Text("Register"),)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
