import 'package:flutter/material.dart';
import 'package:madh/common/widgets/button/custom_button.dart';
import 'package:madh/core/size/const_size.dart';
import 'package:madh/data/model/auth/sign_in_user_req.dart';
import 'package:madh/domain/usecase/auth/sign_in.dart';
import 'package:madh/presentation/Home/pages/home.dart';
import 'package:madh/presentation/splash/widgets/main_logo.dart';
import 'package:madh/service_locator.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
              CustomButton(
                  onPressed: () async {
                    var result = await s1<SignInUseCase>().call(
                        params: SignInUserReq(
                            email: _email.text.toString(),
                            password: _password.text.toString()));
                    result.fold(
                      (l) {
                        var snackBar = SnackBar(content: Text(l));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      (r) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          (route) => false,
                        );
                      },
                    );
                  },
                  title: "Sign Ip"),
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
