import 'package:flutter/material.dart';
import 'package:madh/common/widgets/button/custom_button.dart';
import 'package:madh/core/size/const_size.dart';
import 'package:madh/presentation/splash/widgets/main_logo.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                  const CustomTextField(
                    hintText: "Full Name",
                  ),
                  kHeight(15),
                  const CustomTextField(
                    hintText: "Enter Email",
                  ),
                  kHeight(15),
                  const CustomTextField(
                    hintText: "Password",
                  ),
                ],
              ),
              CustomButton(onPressed: () {}, title: "Sign Up"),
            ],
          ),
        ));
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
