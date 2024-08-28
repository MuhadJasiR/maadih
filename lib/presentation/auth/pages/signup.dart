import 'package:flutter/material.dart';
import 'package:madh/common/widgets/button/custom_button.dart';
import 'package:madh/core/size/const_size.dart';
import 'package:madh/data/model/auth/create_user_req.dart';
import 'package:madh/domain/usecase/auth/signup.dart';
import 'package:madh/presentation/splash/widgets/main_logo.dart';
import 'package:madh/service_locator.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const MaadihLogo(),
              const Text(
                "Register",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  CustomTextField(
                    controller: _fullNameController,
                    hintText: "Full Name",
                  ),
                  kHeight(15),
                  CustomTextField(
                    controller: _emailController,
                    hintText: "Enter Email",
                  ),
                  kHeight(15),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: "Password",
                  ),
                ],
              ),
              CustomButton(
                  onPressed: () async {
                    var result = await s1<SignUpUseCase>().call(
                        params: CreateUserReq(
                            email: _emailController.text.toString(),
                            fullName: _fullNameController.text.toString(),
                            password: _passwordController.text.toString()));
                    result.fold(
                      (l) {
                        var snackbar = SnackBar(content: Text(l.message));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                      (r) {},
                    );
                  },
                  title: "Create Account"),
            ],
          ),
        ));
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hintText, required this.controller});

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
