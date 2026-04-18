import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/features/auth/viewmodel/login_provider.dart';

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
      appBar: AppBar(backgroundColor: Colors.red, title: Text("Login")),
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
                  return provider.isloading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: () async {
                            final success = await provider.loginUser(
                              name.text,
                              password.text,
                            );
                            if (success) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("login Successfully"),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(provider.errorMsg ?? "Error"),
                                ),
                              );
                            }
                          },
                          child: Text("login"),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
