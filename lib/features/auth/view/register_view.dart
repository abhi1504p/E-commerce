import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/core/constant/app_snackbar.dart';
import 'package:shoppingapp/core/utils/button_widget.dart';
import 'package:shoppingapp/core/utils/custom_text_field.dart';
import 'package:shoppingapp/features/auth/viewmodel/register_provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

TextEditingController name = TextEditingController();
TextEditingController password = TextEditingController();

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RegisterProvider>();

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, title: Text("Register")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            spacing: 20,
            children: [
              CustomTextFormField(hintText: "Name", controller: name)
              ,
              CustomTextFormField(hintText: "Password", controller: password)
              ,
              if (provider.isloading)
                CircularProgressIndicator()
              else
                ButtonWidget(
                  text: "Register",
                  backgroundColor: Colors.red,
                  onTap: () async {
                    final success = await provider.registerUser(
                      name.text,
                      password.text,
                    );
                    if (success) {
                      AppSnackbar.show(
                        context,
                        message: "Register Successfully",
                      );
                    } else {
                      AppSnackbar.show(
                        context,
                        message: provider.errorMsg.toString(),
                      );
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
