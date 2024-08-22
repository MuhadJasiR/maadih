import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madh/common/widgets/button/custom_button.dart';
import 'package:madh/core/colors/const_colors.dart';
import 'package:madh/core/size/const_size.dart';
import 'package:madh/presentation/auth/pages/signup_or_signin.dart';
import 'package:madh/presentation/chose_mode/bloc/theme_cubit.dart';
import 'package:madh/presentation/splash/widgets/main_logo.dart';

class ChoseMode extends StatelessWidget {
  const ChoseMode({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/background/intoImage2.jpg"))),
          ),
          Container(
            color: kBlackColor.withOpacity(0.7),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  kHeight(size.height * 0.15),
                  const MaadihLogo(),
                  kHeight(size.height * 0.4),
                  const Text(
                    "Chose Mode",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kWhiteColor),
                  ),
                  kHeight(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: kWhiteColor.withOpacity(0.3),
                            child: IconButton(
                                onPressed: () {
                                  print("dark");
                                  context
                                      .read<ThemeCubit>()
                                      .updateTheme(ThemeMode.dark);
                                },
                                icon: const Icon(
                                  Icons.dark_mode_outlined,
                                  color: kWhiteColor,
                                )),
                          ),
                          kHeight(5),
                          const Text(
                            "Dark Mode",
                            style: TextStyle(
                                color: kWhiteColor,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: kWhiteColor.withOpacity(0.3),
                            child: IconButton(
                                onPressed: () {
                                  print("light");
                                  context
                                      .read<ThemeCubit>()
                                      .updateTheme(ThemeMode.light);
                                },
                                icon: const Icon(
                                  Icons.light_mode_outlined,
                                  color: kWhiteColor,
                                )),
                          ),
                          kHeight(5),
                          const Text(
                            "Light Mode",
                            style: TextStyle(
                                color: kWhiteColor,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                  kHeight(20),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpOrSignIn(),
                          ));
                    },
                    title: "Continue",
                  ),
                  kHeight(50)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
