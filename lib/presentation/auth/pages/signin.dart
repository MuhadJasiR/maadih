import 'package:flutter/material.dart';
import 'package:madh/common/widgets/button/custom_button.dart';
import 'package:madh/core/size/const_size.dart';
import 'package:madh/presentation/splash/widgets/main_logo.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const MaadihLogo(),
                  kHeight(20),
                  const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  const CustomTextField(
                    hintText: "Enter Email",
                  ),
                  kHeight(15),
                  const CustomTextField(
                    hintText: "Password",
                  ),
                ],
              ),
              CustomButton(onPressed: () {}, title: "Sign Ip"),
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
