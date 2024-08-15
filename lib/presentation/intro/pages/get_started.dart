import 'package:flutter/material.dart';
import 'package:madh/common/widgets/button/custom_button.dart';
import 'package:madh/core/colors/const_colors.dart';
import 'package:madh/core/size/const_size.dart';
import 'package:madh/presentation/chose_mode/pages/chose_mode.dart';
import 'package:madh/presentation/splash/pages/splash.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

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
                    image: AssetImage("assets/background/introImage1.jpg"))),
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
                    "Enjoy Listening To Halal Madh Songs",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kWhiteColor),
                  ),
                  kHeight(30),
                  const Text(
                    "Lorem Ipsum is simply dummy text of the printing and  sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                    style: TextStyle(color: kWhiteColor),
                    textAlign: TextAlign.center,
                  ),
                  kHeight(20),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChoseMode(),
                          ));
                    },
                    title: "Get Started",
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
