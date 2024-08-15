import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madh/core/colors/const_colors.dart';
import 'package:madh/core/size/const_size.dart';
import 'package:madh/presentation/intro/pages/get_started.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaadihLogo(),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GetStartedPage(),
        ));
  }
}

class MaadihLogo extends StatelessWidget {
  const MaadihLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundColor: kPrimaryColor,
          child: Icon(
            Icons.mosque_rounded,
            color: Colors.white,
            size: 35,
          ),
        ),
        kWidth(10),
        Text(
          "Maadih",
          style: GoogleFonts.anton(
            fontSize: 40,
            color: kPrimaryColor,
          ),
        )
      ],
    );
  }
}
