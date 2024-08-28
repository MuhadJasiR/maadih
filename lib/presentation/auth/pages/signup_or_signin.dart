import 'package:flutter/material.dart';
import 'package:madh/common/widgets/button/custom_button.dart';
import 'package:madh/core/colors/const_colors.dart';
import 'package:madh/core/size/const_size.dart';
import 'package:madh/presentation/auth/pages/signin.dart';
import 'package:madh/presentation/auth/pages/signup.dart';
import 'package:madh/presentation/splash/widgets/main_logo.dart';

class SignUpOrSignIn extends StatelessWidget {
  const SignUpOrSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const MaadihLogo(),
            Column(
              children: [
                const Text(
                  "Enjoy Listening To Halal Madh Songs",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kHeight(30),
                const Text(
                  "Maadih is a proprietary madh song streaming media service provider",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: CustomButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                        },
                        title: "Sign Up")),
                kWidth(10),
                Expanded(
                    child: CustomButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignInPage()));
                        },
                        title: "Sign In")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
